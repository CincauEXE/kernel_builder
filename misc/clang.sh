#! /bin/bash

CloneGugelClang(){
    ClangPath=${MainClangPath}
    [[ "$(pwd)" != "${MainPath}" ]] && cd "${MainPath}"
    if [ ! -d "${ClangPath}" ];then
        git clone https://github.com/ZyCromerZ/google-clang -b 9.0.4-r353983d "${ClangPath}" --depth=1
    else
        cd "${ClangPath}"
        git fetch https://github.com/ZyCromerZ/google-clang 9.0.4-r353983d --depth=1
        git checkout FETCH_HEAD
        [[ ! -z "$(git branch | grep 9.0.4-r353983d)" ]] && git branch -D 9.0.4-r353983d
        git checkout -b 9.0.4-r353983d
    fi
    TypeBuilder="CLANG"
    ClangType="$(${ClangPath}/bin/clang --version | head -n 1)"
}

CloneThirteenGugelClang(){
    ClangPath=${MainClangZipPath}
    [[ "$(pwd)" != "${MainPath}" ]] && cd "${MainPath}"
    mkdir $ClangPath
    rm -rf $ClangPath/*
    if [ ! -e "${MainPath}/clang-r433403.tar.gz" ];then
        wget -q  https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/master/clang-r433403.tar.gz -O "clang-r433403.tar.gz"
    fi
    tar -xf clang-r433403.tar.gz -C $ClangPath
    TypeBuilder="CLANG"
    ClangType="$(${ClangPath}/bin/clang --version | head -n 1)"
}

CloneOldDTCClang(){
    ClangPath=${MainClangPath}
    [[ "$(pwd)" != "${MainPath}" ]] && cd "${MainPath}"
    if [ ! -d "${ClangPath}" ];then
        git clone https://github.com/nibaji/DragonTC-8.0 -b master "${ClangPath}" --depth=1
    else
        cd "${ClangPath}"
        git fetch https://github.com/nibaji/DragonTC-8.0 master --depth=1
        git checkout FETCH_HEAD
        [[ ! -z "$(git branch | grep master)" ]] && git branch -D master
        git checkout -b master
    fi
    TypeBuilder="DTC-OLD"
    ClangType="$(${ClangPath}/bin/clang --version | head -n 1)"
}

CloneDTCClang(){
    ClangPath=${MainClangPath}
    [[ "$(pwd)" != "${MainPath}" ]] && cd "${MainPath}"
    if [ ! -d "${ClangPath}" ];then
        git clone https://github.com/NusantaraDevs/DragonTC -b 10.0 "${ClangPath}" --depth=1
    else
        cd "${ClangPath}"
        git fetch https://github.com/NusantaraDevs/DragonTC 10.0 --depth=1
        git checkout FETCH_HEAD
        [[ ! -z "$(git branch | grep 10.0)" ]] && git branch -D 10.0
        git checkout -b 10.0
    fi
    TypeBuilder="DTC"
    ClangType="$(${ClangPath}/bin/clang --version | head -n 1)"
}

CloneProtonClang(){
    ClangPath=${MainClangPath}
    [[ "$(pwd)" != "${MainPath}" ]] && cd "${MainPath}"
    if [ ! -d "${ClangPath}" ];then
        git clone https://github.com/kdrag0n/proton-clang -b master "${ClangPath}" --depth=1
    else
        cd "${ClangPath}"
        git fetch https://github.com/kdrag0n/proton-clang master --depth=1
        git checkout FETCH_HEAD
        [[ ! -z "$(git branch | grep master)" ]] && git branch -D master
        git checkout -b master
    fi
    TypeBuilder="Proton"
    ClangType="$(${ClangPath}/bin/clang --version | head -n 1)"
}

CloneSdClang(){
    ClangPath=${MainClangPath}
    [[ "$(pwd)" != "${MainPath}" ]] && cd "${MainPath}"
    if [ ! -d "${ClangPath}" ];then
        git clone https://github.com/ThankYouMario/proprietary_vendor_qcom_sdclang -b ruby-12 "${ClangPath}" --depth=1
    else
        cd "${ClangPath}"
        git fetch https://github.com/ThankYouMario/proprietary_vendor_qcom_sdclang ruby-12 --depth=1
        git checkout FETCH_HEAD
        [[ ! -z "$(git branch | grep ruby-12)" ]] && git branch -D ruby-12
        git checkout -b ruby-12
    fi
    TypeBuilder="SDClang"
    ClangType="$(${ClangPath}/bin/clang --version | head -n 1)"
}