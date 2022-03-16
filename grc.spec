Summary:   Generic Colouriser
Name:      grc
Version:   1.13
Release:   1
License:   GPL
Group:     Development/Tools
URL:       http://kassiopeia.juls.savba.sk/~garabik/software/grc.html
Source0:   https://github.com/garabik/grc/archive/v%{version}/%{name}-%{version}.tar.gz
BuildArch: noarch

%description
Generic Colouriser is yet another colouriser for beautifying your logfiles
or output of commands.

Authors:
--------
    Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>

%prep
%autosetup -p1

# Keep original timestamps
sed -e 's/cp -fv /cp -fvp /' -i install.sh

%install
./install.sh "${RPM_BUILD_ROOT}%{_prefix}" "${RPM_BUILD_ROOT}"

%files
%doc CHANGES CREDITS README* TODO Regexp.txt
%license debian/copyright
%{_bindir}/%{name}*
%{_datadir}/%{name}/*
%{_mandir}/man1/%{name}*
%config(noreplace) %{_sysconfdir}/grc.conf
%config(noreplace) %{_sysconfdir}/grc.zsh
%config(noreplace) %{_sysconfdir}/grc.fish
%config(noreplace) %{_sysconfdir}/profile.d/grc.sh

%changelog
* Mon Feb 07 2022 Petr Menšík <pemensik@redhat.com> - 1.13-1
- Update spec file for Fedora guidelines

* Fri Sep 01 2006 Valerij Klein <vklein@console-colors.de> 1.0.7-1
- Minor changes in SPEC
