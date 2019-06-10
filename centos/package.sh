#!/bin/bash

# 如果没有安装包, 就安装
# $1 array 安装失败的包, 数组变量名
# $n (n>1) 包名
function pkgtryinstall() {
    pkg_try_install_pkgs=($@);
    arrayshift "pkg_try_install_pkgs"
    pkg_try_install_report_install=();
    pkg_try_install_report_exist=();
    pkg_try_install_report_failure=();

    for pkg_try_install_pkg in ${pkg_try_install_pkgs[@]}
    do
        yum list installed ${pkg_try_install_pkg}
        if test ! $? -eq 0
        then
            yum -y install ${pkg_try_install_pkg}
            if test ! $? -eq 0
            then 
                arraypush "pkg_try_install_report_install" "${pkg_try_install_pkg}"
            else
                arraypush "pkg_try_install_report_failure" "${pkg_try_install_pkg}"
            fi
        else
            arraypush "pkg_try_install_report_exist" "${pkg_try_install_pkg}"
        fi
    done

    # info "所有: ${pkg_try_install_pkgs[*]}"
    # info "安装: ${pkg_try_install_report_install[*]}"
    # info "存在: ${pkg_try_install_report_exist[*]}"
    # error "失败: ${pkg_try_install_report_failure[*]}"
    arrayliterals "pkg_try_install_report_failure_literals" "pkg_try_install_report_failure"
    eval "$1=${pkg_try_install_report_failure_literals}"
    return 0;
}