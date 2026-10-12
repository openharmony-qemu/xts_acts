# Acts Validator Lite

轻量小型系统（ipcamera/smartVision）可视化人工验证测试框架。操作员在设备上逐项判定 Pass/Fail，应用通过串口输出结果，xdevice 解析生成 JUnit XML 报告。

## 编译

```bash
# LiteOS 内核
./build.sh --product-name ipcamera_hispark_taurus --build-xts=true

# Linux 内核
./build.sh --product-name ipcamera_hispark_taurus_linux --build-xts=true
```

产物在 `out/.../suites/acts_validator_lite/`，独立于 `suites/acts/`，`run acts` 不会扫到。

> `type_kernel` 由编译时按目标内核自动注入（LiteOS 产物为 `lite`，Linux 产物为 `linux`），无需手工修改。

## 执行

### 1. 配置 `config/user_config.xml`

```xml
<user_config>
    <environment>
        <device type="com" label="ipcamera">
            <serial>
                <com>com4</com>           <!-- 修改：串口号 -->
                <type>cmd</type>
                <baud_rate>115200</baud_rate>
            </serial>
        </device>
    </environment>
    <testcases>
        <server label="NfsServer">
            <ip>192.168.1.100</ip>        <!-- 修改：NFS 服务器 IP -->
            <dir>D:\test</dir>            <!-- 修改：NFS 共享目录 -->
            <remote>false</remote>         <!-- true=远程 SFTP，false=本地目录 -->
        </server>
    </testcases>
</user_config>
```

| 字段 | 说明 |
|------|------|
| `com` | 设备串口号（Windows: `com4`，Linux: `/dev/ttyUSB0`） |
| `ip` | NFS 服务器 IP，需与设备同网段 |
| `dir` | NFS 共享目录，NFS 挂载到设备 `/test_root` |
| `remote` | `false` 时用本地 `shutil.copy`，`true` 时用 SFTP |

### 2. 执行

```bash
cd out/.../suites/acts_validator_lite
python3 -m xdevice
run validator -ta update:true
```

| 命令 | 行为 |
|------|------|
| `run validator -ta update:true` | bm 安装 HAP（无需重启）→ 测试 → bm 卸载 |
| `run validator` | 快速重跑（HAP 已安装，不卸载） |

### 3. 报告

报告在 `reports/` 目录下。

## 执行流程

```
xdevice 自动:
  1. MountKit: NFS 挂载 testcases → 设备 /test_root（type_kernel 编译时自动注入）
  2. ifconfig eth0 <设备IP>
  3. cp testcases/ability-assistant、bm → /storage/ + chmod +x
  4. bm install -p <test_root>/ActsValidatorLite.hap（成功则无需重启；
     失败时回退：cp 到 /system/internal/ + rm bundles + reboot）
  5. ./aa start -p <bundle> -n <ability>（无则提示手动启动）
  6. 等待操作员输入 Y

操作员:
  7. 在设备上测试用例，点 Pass/Fail
  8. 返回主入口，点 Generate Report
  9. 在控制台输入 Y

xdevice 自动:
  10. 优先读取设备端报告文件 report.txt，其次解析串口 [report] → 生成 XML 报告
  11. 仅 -ta update:true 时：bm 卸载 HAP（失败时回退：rm + reboot）
```

## 内核差异

| 差异 | Linux | LiteOS | 处理 |
|------|-------|--------|------|
| 挂载 | `toybox mount -t nfs` | `mount ip:dir /test_root nfs` | MountKit 自动 |
| 重启 | `reboot` | `reset` | driver 自动 |
| 路径前缀 | `/storage` | `/storage` | 统一 |
| aa 拉起 | 有 | 有（`tools_lite` 编译） | 自动重试 3 次 |
| chmod +x | 需要 | 不需要 | 仅 Linux |
| bm 执行方式 | `/storage/bm install ...`（绝对路径） | `cd /storage && ./bm install ...`（LiteOS shell 不支持绝对路径执行） | driver 自动 |
| `type_kernel` | `linux` | `lite` | 编译时按目标内核自动注入，无需手工配置 |

## Test.json 配置

需配置：

| 配置项 | 说明 |
|--------|------|
| `type` | 固定 `ValidatorLite` |
| `bundle-name` | 应用 bundleName |
| `ability-name` | Ability 名称 |
| `hap-file-name` | HAP 文件名 |
| `timeout` | 串口超时（毫秒） |

driver 自动处理：内核检测、设备 IP、HAP 安装/卸载、ability assistant 拷贝。

## 目录结构

```
acts_validator_lite/
├── BUILD.gn                  # 构建定义
├── Test.json                 # xdevice 测试配置
├── README.md                 # 本文档
├── DEVELOPMENT.md            # 用例开发指南
├── pre_build.py
├── acts_validator_lite_build_js.py
├── rm_from_rootfs.py
├── cert/
└── entry/src/main/
    ├── config.json           # 应用配置
    └── js/MainAbility/
        ├── app.js            # 用例定义 (testItems) + 串口协议
        ├── manifest.json     # 路由注册
        └── pages/
            ├── index/        # 主入口
            ├── common/help/  # 帮助页
            ├── ArkUI/        # ArkUI 子系统
            ├── PowerManager/
            ├── FileManagement/
            ├── DistributedData/
            ├── Startup/
            ├── Communication/
            ├── Sensors/
            ├── Location/
            └── RouterTransition/  # 页切换动效(10项) + target 探针页
```

## 用例开发

详见 [DEVELOPMENT.md](./DEVELOPMENT.md)。
