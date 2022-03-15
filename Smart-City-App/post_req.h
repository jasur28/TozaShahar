#ifndef POST_REQ_H
#define POST_REQ_H

#include <QObject>
#include <QNetworkReply>
#include <QHttpMultiPart>
#include <QFile>
#include <QNetworkAccessManager>
#include <QQuickImageProvider>

class POST_REQ : public QObject//, public QQuickImageProvider
{
    Q_OBJECT
public:
    POST_REQ();
    Q_INVOKABLE void upload(const QString &lat,
                            const QString &lon,
                            const QString &dateTime,
                            const QString &path,
                            const QString &pathImage);
    Q_INVOKABLE void processImage(const QString& path);


private slots:
   void replyfinished(QNetworkReply* reply);
   void uploadProgress(qint64 bytesSent, qint64 bytesTotal);
};

#endif // POST_REQ_H
