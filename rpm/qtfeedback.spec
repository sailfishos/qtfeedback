Name:       qt5-qtfeedback
Summary:    Qt Feedback
Version:    5.0.2
Release:    1%{?dist}
License:    LGPLv2 with exception or GPLv3 or Qt Commercial
URL:        https://github.com/sailfishos/qtfeedback
Source0:    %{name}-%{version}.tar.bz2
BuildRequires:  qt5-qtcore-devel
BuildRequires:  qt5-qtgui-devel
BuildRequires:  qt5-qtopengl-devel
BuildRequires:  qt5-qtdeclarative-devel
BuildRequires:  qt5-qtdeclarative-qtquick-devel
BuildRequires:  qt5-qmake
BuildRequires:  qt5-qttools-qdoc
BuildRequires:  qt5-qttools-qthelp-devel
BuildRequires:  qt5-tools

%description
Qt is a cross-platform application and UI framework. Using Qt, you can
write web-enabled applications once and deploy them across desktop,
mobile and embedded systems without rewriting the source code.
.
This package contains the Qt Feedback library

%package devel
Summary:    Qt QtFeedback - development files
Requires:   %{name} = %{version}-%{release}

%description devel
Qt is a cross-platform application and UI framework. Using Qt, you can
write web-enabled applications once and deploy them across desktop,
mobile and embedded systems without rewriting the source code.
.
This package contains the QtFeedback module development files

%package doc
Summary:    Qt QtFeedback - documentation
License:    GNU Free Documentation License or Qt Commercial
Requires:   %{name} = %{version}-%{release}

%description doc
Qt is a cross-platform application and UI framework. Using Qt, you can
write web-enabled applications once and deploy them across desktop,
mobile and embedded systems without rewriting the source code.
.
This package contains the QtFeedback module documentation


%prep
%setup -q -n %{name}-%{version}

%build
%qmake5 CONFIG+=package multimedia_disabled=yes
%make_build
make docs

%install
%qmake5_install install_qch_docs

# Remove unneeded .la files
rm -f %{buildroot}/%{_libdir}/*.la

%post -p /sbin/ldconfig
%postun -p /sbin/ldconfig

%files
%license LICENSE.LGPL
%license LGPL_EXCEPTION.txt
%license LICENSE.GPL
%{_libdir}/libQt5Feedback.so.0
%{_libdir}/libQt5Feedback.so.0.*
%{_libdir}/qt5/qml/

%files devel
%{_libdir}/libQt5Feedback.so
%{_libdir}/libQt5Feedback.prl
%{_libdir}/pkgconfig/*
%{_includedir}/qt5/*

%files doc
%license LICENSE.FDL
%{_docdir}/qt5/*
