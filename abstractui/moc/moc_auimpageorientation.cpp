/****************************************************************************
** Meta object code from reading C++ file 'auimpageorientation.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../auimpageorientation.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'auimpageorientation.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_AUIMPageOrientation_t {
    QByteArrayData data[6];
    char stringdata[87];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_AUIMPageOrientation_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_AUIMPageOrientation_t qt_meta_stringdata_AUIMPageOrientation = {
    {
QT_MOC_LITERAL(0, 0, 19),
QT_MOC_LITERAL(1, 20, 15),
QT_MOC_LITERAL(2, 36, 9),
QT_MOC_LITERAL(3, 46, 12),
QT_MOC_LITERAL(4, 59, 13),
QT_MOC_LITERAL(5, 73, 12)
    },
    "AUIMPageOrientation\0PageOrientation\0"
    "Automatic\0LockPortrait\0LockLandscape\0"
    "LockPrevious\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AUIMPageOrientation[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       1,   14, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // enums: name, flags, count, data
       1, 0x0,    4,   18,

 // enum data: key, value
       2, uint(AUIMPageOrientation::Automatic),
       3, uint(AUIMPageOrientation::LockPortrait),
       4, uint(AUIMPageOrientation::LockLandscape),
       5, uint(AUIMPageOrientation::LockPrevious),

       0        // eod
};

void AUIMPageOrientation::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObject AUIMPageOrientation::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AUIMPageOrientation.data,
      qt_meta_data_AUIMPageOrientation,  qt_static_metacall, 0, 0}
};


const QMetaObject *AUIMPageOrientation::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AUIMPageOrientation::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AUIMPageOrientation.stringdata))
        return static_cast<void*>(const_cast< AUIMPageOrientation*>(this));
    return QObject::qt_metacast(_clname);
}

int AUIMPageOrientation::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
