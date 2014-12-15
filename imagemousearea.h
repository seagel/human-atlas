#ifndef IMAGEMOUSEAREA_H
#define IMAGEMOUSEAREA_H

#include <QQuickItem>

class ImageMouseArea : public QQuickItem {
    Q_OBJECT
    Q_PROPERTY(QString imageName READ imageName WRITE setImageName)

public:
    explicit ImageMouseArea(QQuickItem *parent = 0);

    QString imageName() const {
        return m_imageName;
    }

signals:
    void clicked();
    void imageNameChanged();

private:
    QString m_imageName;

public slots:
    void setImageName(QString arg) {
        m_imageName = arg;
    }

    // QQuickItem interface
public:
    virtual bool contains(const QPointF &point) const;

    // QQuickItem interface
protected:
    virtual void mousePressEvent(QMouseEvent *event);
};

#endif // IMAGEMOUSEAREA_H
