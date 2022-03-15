#include "post_req.h"
#include <QQmlEngine>
#include <QQmlContext>
#include <QtQuick/QQuickImageProvider>
#include <QDebug>
#include <QFileInfo>


POST_REQ::POST_REQ()
{

}

void POST_REQ::processImage(const QString& path) {
    QUrl imageUrl(path);
    qDebug() << path << "========PATH=========";
    QQmlEngine* engine = QQmlEngine::contextForObject(this)->engine();
    QQmlImageProviderBase* imageProviderBase = engine->imageProvider(imageUrl.host());
    QQuickImageProvider* imageProvider = static_cast<QQuickImageProvider*>(imageProviderBase);

    QSize imageSize;
    QString imageId = imageUrl.path().remove(0,1);
    qDebug() << imageId << "========ID=========";
    QImage image = imageProvider->requestImage(imageId, &imageSize, imageSize);
    QString strPath="/home/jasuryuldashev/camera.jpeg";
    if( !image.isNull()) {
        // обработка изображения
        qDebug() << "img.format() Foto" << image.format();
        qDebug() << "working" << endl;

        image.save(strPath,"JPEG");
    }
}

void POST_REQ::upload(const QString &lat,
                      const QString &lon,
                      const QString& dateTime,
                      const QString& textComp,
                      const QString& pathImage)
{
    //==================================
    qDebug()<< lat << lon << dateTime  << pathImage;


    //=========================

    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);

    //lat
    QHttpPart latitude;
    //latitude.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    latitude.setHeader(QNetworkRequest::ContentDispositionHeader,
                       QVariant("form-data; name=\"lat\""));
    latitude.setBody(lat.toUtf8());

    //lon
    QHttpPart longitude;
    //longitude.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    longitude.setHeader(QNetworkRequest::ContentDispositionHeader,
                        QVariant("form-data; name=\"lon\""));
    longitude.setBody(lon.toUtf8());


    //complains
    QHttpPart complains;
    //complains.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    complains.setHeader(QNetworkRequest::ContentDispositionHeader,
                        QVariant("form-data; name=\"textData\""));
    complains.setBody(textComp.toUtf8());







    //date of complain
    QHttpPart date;
    //date.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    date.setHeader(QNetworkRequest::ContentDispositionHeader,  QVariant("form-data; name=\"timeData\""));
    date.setBody(dateTime.toUtf8());

    // work image also here
    QString apkLocation = pathImage;
    //QString apkLocation = "image://camera/preview_1";
    QFileInfo fileInfo(pathImage);
    QFile *file = new QFile(pathImage);
    file->open(QIODevice::ReadWrite);
    //image with complain

    QHttpPart imagePart;
    imagePart.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("image/jpeg"));
    imagePart.setHeader(QNetworkRequest::ContentDispositionHeader,
                        QVariant(QString("form-data; name=\"photoData\"; filename=\"%1\"").arg(fileInfo.fileName()).toLatin1()));
    imagePart.setRawHeader("Content-Transfer-Encoding","binary");
    imagePart.setBodyDevice(file);
    file->setParent(multiPart); // we cannot delete the file now, so delete it with the multiPart

    multiPart->append(latitude);
    multiPart->append(longitude);
    multiPart->append(complains);
    multiPart->append(imagePart);
    multiPart->append(date);


    QUrl url("http://192.168.0.107:5000/addCamera");
    QNetworkRequest request(url);
    QNetworkAccessManager *networkManager= new QNetworkAccessManager;
    QNetworkReply *reply = networkManager->post(request,multiPart);
    multiPart->setParent(reply);


    connect(networkManager,SIGNAL(finished(QNetworkReply*)),this,SLOT(replyfinished(QNetworkReply*)));
    connect(reply, SIGNAL(uploadProgress(qint64, qint64)),
            this, SLOT  (uploadProgress(qint64, qint64)));
}

void POST_REQ::uploadProgress(qint64 bytesSent, qint64 bytesTotal)
{
    qDebug() << "---------Uploaded--------------" << bytesSent<< "of" <<bytesTotal;
}

void POST_REQ::replyfinished(QNetworkReply* reply1)
{
    qDebug() << QString(reply1->readAll());
    qDebug() << QString(reply1->errorString());
}
