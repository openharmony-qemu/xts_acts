# 静态 XTS 签名环境（chip_static / counter_static 等共用）
# 用法: source signing-materials/env.sh && python3 hapbuild.py build <工程>
#
# 重要: OHOS_HAPSIGNER_RESULT 必须指向「证书源目录」，不能指向工程内 autosign/
# （hapbuild sign 会先清空工程 autosign 再从源目录拷贝；指到自己会删光证书）

export OHOS_HAPSIGNER_RESULT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
