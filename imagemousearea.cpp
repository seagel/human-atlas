#include "imagemousearea.h"
#include <QImage>

ImageMouseArea::ImageMouseArea(QQuickItem *parent) :
    QQuickItem(parent)
{
    setAcceptedMouseButtons(Qt::LeftButton);
    setClip(true);
}

bool ImageMouseArea::contains(const QPointF &point) const
{
    auto newString = m_imageName;
    QImage image(newString.replace("qrc://", ":"));

    return image.rect().contains(point.toPoint())
            && qAlpha(image.pixel(point.toPoint())) > 0;
}

void ImageMouseArea::mousePressEvent(QMouseEvent *event)
{
    emit clicked();
    event->accept();
}
