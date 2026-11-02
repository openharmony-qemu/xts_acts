/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <atomic>
#include "hilog/log.h"
#include <chrono>
#include <cstdio>
#include <fcntl.h>
#include <fstream>
#include <iostream>
#include <memory>
#include <mutex>
#include <signal.h>
#include <sstream>
#include <string>
#include <sys/mman.h>
#include <sys/stat.h>
#include <thread>
#include <unistd.h>

#include "input_method_ability.h"
#include "input_method_engine_listener.h"
#include "transaction/rs_transaction.h"
#include "ui/rs_surface_node.h"
#include "window.h"
#include "window_manager.h"
#include "window_property.h"
#include "wm/include/window_adapter.h"
#include "zidl/window_stub.h"

using namespace OHOS;
using namespace OHOS::MiscServices;
using namespace OHOS::Rosen;

namespace {
std::mutex g_eventOutputMutex;

int64_t ReadPssKb()
{
    std::ifstream input("/proc/self/smaps_rollup");
    std::string line;
    while (std::getline(input, line)) {
        if (line.rfind("Pss:", 0) == 0) {
            std::istringstream value(line.substr(4));
            int64_t kb = -1;
            value >> kb;
            return kb;
        }
    }
    return -1;
}

void ReclaimIdleClientPages(const char *phase)
{
    // Only this test process's idle private pages. PAGEOUT preserves contents:
    // all real objects, Binder identities and windows remain alive, and normal
    // page faults bring data back. Never discard live data with DONTNEED/FREE.
    const auto before = ReadPssKb();
    uint64_t advisedBytes = 0;
    uint32_t failedRanges = 0;
    std::ifstream input("/proc/self/maps");
    std::string line;
    while (std::getline(input, line)) {
        unsigned long start = 0;
        unsigned long end = 0;
        char flags[5] = {};
        if (std::sscanf(line.c_str(), "%lx-%lx %4s", &start, &end, flags) != 3 ||
            flags[0] != 'r' || flags[2] == 'x' || flags[3] != 'p' || end <= start ||
            line.find("/dev/") != std::string::npos || line.find("[stack") != std::string::npos ||
            line.find("[vvar") != std::string::npos || line.find("[vdso") != std::string::npos) {
            continue;
        }
        if (madvise(reinterpret_cast<void *>(start), end - start, MADV_PAGEOUT) == 0) {
            advisedBytes += end - start;
        } else {
            ++failedRanges;
        }
    }
    const auto after = ReadPssKb();
    std::lock_guard<std::mutex> lock(g_eventOutputMutex);
    std::cout << "MEMORY_RECLAIM pid=" << getpid() << " phase=" << phase
              << " before_pss_kb=" << before << " after_pss_kb=" << after
              << " advised_bytes=" << advisedBytes << " failed_ranges=" << failedRanges << std::endl;
}

class EvictionListener : public InputMethodEngineListener {
public:
    void OnUnregister() override
    {
        std::lock_guard<std::mutex> lock(g_eventOutputMutex);
        std::cout << "EVICTED pid=" << getpid() << " count=" << ++count_ << std::endl;
    }

private:
    std::atomic<uint32_t> count_ { 0 };
};

// Empty native WMS client: acknowledge real server notifications without
// starting a UI renderer/GPU context in every retained registration process.
// This does not implement or invoke any IMF callback or identity check.
class CapacityWindowAgent : public WindowStub {
public:
    explicit CapacityWindowAgent(const sptr<WindowProperty> &property) : property_(property)
    {
    }
    OHOS::Rosen::WMError UpdateWindowRect(const OHOS::Rosen::Rect &, bool, WindowSizeChangeReason,
        const std::shared_ptr<RSTransaction> &) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateWindowMode(const WindowModeInfo &) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateWindowModeSupportType(uint32_t) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateFocusStatus(bool focused) override
    {
        focused_ = focused;
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateAvoidArea(const sptr<AvoidArea> &, AvoidAreaType) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateWindowState(WindowState state) override
    {
        state_ = state;
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateWindowDragInfo(const PointInfo &, DragEvent) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateDisplayId(DisplayId, DisplayId) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateOccupiedAreaChangeInfo(const sptr<OccupiedAreaChangeInfo> &,
        const std::map<AvoidAreaType, AvoidArea> &, const std::shared_ptr<RSTransaction> &) override

    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateOccupiedAreaAndRect(const sptr<OccupiedAreaChangeInfo> &, const OHOS::Rosen::Rect &,
        const std::map<AvoidAreaType, AvoidArea> &, const std::shared_ptr<RSTransaction> &) override

    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateActiveStatus(bool) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    sptr<WindowProperty> GetWindowProperty() override
    {
        return property_;
    }
    OHOS::Rosen::WMError NotifyTouchOutside() override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError NotifyScreenshot() override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError NotifyScreenshotAppEvent(ScreenshotEventType) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError DumpInfo(const std::vector<std::string> &) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError NotifyDestroy() override
    {
        state_ = WindowState::STATE_DESTROYED;
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError NotifyForeground() override
    {
        state_ = WindowState::STATE_SHOWN;
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError NotifyBackground() override
    {
        state_ = WindowState::STATE_HIDDEN;
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError NotifyWindowClientPointUp(const std::shared_ptr<MMI::PointerEvent> &) override

    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError UpdateZoomTransform(const Transform &, bool) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    OHOS::Rosen::WMError RestoreSplitWindowMode(uint32_t) override
    {
        return OHOS::Rosen::WMError::WM_OK;
    }
    void ConsumeKeyEvent(std::shared_ptr<MMI::KeyEvent>) override
    {
    }
    void NotifyForegroundInteractiveStatus(bool) override
    {
    }
    void NotifyMMIServiceOnline(uint32_t) override
    {
    }

private:
    sptr<WindowProperty> property_;
    std::atomic<bool> focused_ { false };
    std::atomic<WindowState> state_ { WindowState::STATE_INITIAL };
};

class CapacityWindow {
public:
    bool Create()
    {
        property_ = new WindowProperty();
        property_->SetWindowName("acts-inapp-proxy-capacity-" + std::to_string(getpid()));
        property_->SetWindowType(WindowType::WINDOW_TYPE_SYSTEM_FLOAT);
        property_->SetWindowMode(WindowMode::WINDOW_MODE_FLOATING);
        property_->SetRequestRect({ 40, 80, 180, 80 });
        property_->SetWindowRect({ 40, 80, 180, 80 });
        property_->SetFocusable(true);
        property_->SetTouchable(false);
        property_->SetDisplayId(ImfCommonConst::DEFAULT_DISPLAY_ID);
        property_->SetAnimationFlag(static_cast<uint32_t>(WindowAnimation::NONE));
        agent_ = new CapacityWindowAgent(property_);
        RSSurfaceNodeConfig config;
        config.SurfaceNodeName = property_->GetWindowName();
        surface_ = RSSurfaceNode::Create(config, RSSurfaceNodeType::DEFAULT, true, false);
        if (surface_ == nullptr) {
            return false;
        }
        auto result = OHOS::Rosen::WindowAdapter::GetInstance().CreateWindow(
            agent_, property_, surface_, windowId_, nullptr);
        if (result != OHOS::Rosen::WMError::WM_OK) {
            std::cout << "====> WINDOW_CREATE_FAILED pid=" << getpid() << " ret=" << static_cast<int>(result)
                      << std::endl;
            return false;
        }
        property_->SetWindowId(windowId_);
        surface_->SetWindowId(windowId_);
        return true;
    }
    OHOS::Rosen::WMError Show()
    {
        return OHOS::Rosen::WindowAdapter::GetInstance().AddWindow(property_);
    }
    OHOS::Rosen::WMError RequestFocus()
    {
        return OHOS::Rosen::WindowAdapter::GetInstance().RequestFocus(windowId_);
    }
    uint32_t GetWindowId() const
    {
        return windowId_;
    }
    OHOS::Rosen::WMError Destroy()
    {
        auto result = OHOS::Rosen::WindowAdapter::GetInstance().DestroyWindow(windowId_);
        std::cout << "WINDOW_DESTROYED pid=" << getpid() << " window=" << windowId_
                  << " ret=" << static_cast<int>(result) << std::endl;
        if (result == OHOS::Rosen::WMError::WM_OK) {
            surface_.reset();
            RSTransaction::FlushImplicitTransaction();
            agent_ = nullptr;
            property_ = nullptr;
        }
        return result;
    }

private:
    sptr<WindowProperty> property_;
    sptr<IWindow> agent_;
    RSSurfaceNode::SharedPtr surface_;
    uint32_t windowId_ { 0 };
};
} // namespace

// Test-only native load client. Every registration uses this process's real
// Binder identity and an independently queried real WM focus. No service map,
// synthetic PID, identity override, or direct callback invocation is used.
std::unique_ptr<CapacityWindow> CreateCapacityWindow()
{
    auto window = std::make_unique<CapacityWindow>();
    if (!window->Create()) {
        return nullptr;
    }
    return window;
}

int RunClient()
{
    std::unique_ptr<CapacityWindow> window;
    auto listener = std::make_shared<EvictionListener>();
    InputMethodAbility::GetInstance().SetImeListener(listener);
    ReclaimIdleClientPages("READY");
    std::cout << "READY pid=" << getpid() << " uid=" << getuid() << std::endl;
    std::string command;
    while (std::cin >> command) {
        if (command == "QUIT") {
            auto ret = InputMethodAbility::GetInstance().UnregisterInAppProxyIme();
            auto windowResult = OHOS::Rosen::WMError::WM_OK;
            if (window != nullptr) {
                windowResult = window->Destroy();
            }
            std::cout << "CLEANUP pid=" << getpid() << " ret=" << ret << std::endl;
            return ret == ErrorCode::NO_ERROR && windowResult == OHOS::Rosen::WMError::WM_OK ? 0 : 4;
        }
        if (command != "REGISTER" && command != "REGISTER_HOLD") {
            std::cout << "====> INVALID_COMMAND" << std::endl;
            continue;
        }
        if (window == nullptr) {
            window = CreateCapacityWindow();
        }
        if (window == nullptr) {
            std::cout << "====> SETUP_FAILED create_window pid=" << getpid() << std::endl;
            return 3;
        }
        auto shown = window->Show();
        auto focused = window->RequestFocus();
        FocusChangeInfo info;
        int stableSamples = 0;
        const auto windowId = window->GetWindowId();
        for (int i = 0; i < 60; ++i) {
            WindowManager::GetInstance().GetFocusWindowInfo(info, ImfCommonConst::DEFAULT_DISPLAY_ID);
            stableSamples = info.pid_ == getpid() && info.windowId_ == static_cast<int32_t>(windowId) ?
                stableSamples + 1 : 0;
            if (stableSamples >= 6) {
                break;
            }
            std::this_thread::sleep_for(std::chrono::milliseconds(50));
        }
        if (stableSamples < 6) {
            window->Destroy();
            window = nullptr;
            std::cout << "====> FOCUS_FAILED pid=" << getpid() << " actual=" << info.pid_
                      << " show=" << static_cast<int32_t>(shown)
                      << " request=" << static_cast<int32_t>(focused) << std::endl;
            continue;
        }
        std::cout << "FOCUS_CONFIRMED pid=" << getpid() << " focused=" << info.pid_
                  << " window=" << windowId << " actual_window=" << info.windowId_
                  << " display=0 samples=" << stableSamples << std::endl;
        RegisterOptions options;
        const auto registrationStart = std::chrono::steady_clock::now();
        auto ret = InputMethodAbility::GetInstance().RegisterInAppProxyIme(options);
        const auto registrationUs = std::chrono::duration_cast<std::chrono::microseconds>(
            std::chrono::steady_clock::now() - registrationStart).count();
        std::cout << "REGISTERED pid=" << getpid() << " focused=" << info.pid_ << " ret=" << ret << std::endl;
        std::cout << "REGISTER_MEASUREMENT pid=" << getpid() << " microseconds=" << registrationUs
                  << " ret=" << ret << std::endl;
        WindowManager::GetInstance().GetFocusWindowInfo(info, ImfCommonConst::DEFAULT_DISPLAY_ID);
        std::cout << "FOCUS_AFTER pid=" << getpid() << " focused=" << info.pid_
                  << " window=" << windowId << " actual_window=" << info.windowId_ << std::endl;
        ReclaimIdleClientPages("REGISTER");
        if (command == "REGISTER") {
            // The real WM focus has already been independently checked at the
            // Binder call. Keep the registered process/core alive, release only
            // the fixture window; a later registration creates a fresh window.
            auto released = window->Destroy();
            window = nullptr;
            std::cout << "WINDOW_RELEASED pid=" << getpid() << " ret="
                      << static_cast<int32_t>(released) << std::endl;
            if (released != OHOS::Rosen::WMError::WM_OK) {
                return 6;
            }
        }
    }
    if (window != nullptr) {
        window->Destroy();
    }
    return 5;
}

int ReadThreadCount()
{
    std::ifstream status("/proc/self/status");
    std::string line;
    while (std::getline(status, line)) {
        if (line.rfind("Threads:", 0) == 0) {
            std::istringstream value(line.substr(8));
            int count = -1;
            value >> count;
            return count;
        }
    }
    return -1;
}

int RunForkServer(const std::string &root)
{
    // Fork only the single-threaded loader image. The parent never initializes
    // an IMF, Binder or WMS client; every child creates its own real objects.
    if (root.rfind("/data/local/tmp/acts-inapp-proxy-capacity-", 0) != 0 ||
        root.find("..") != std::string::npos || ReadThreadCount() != 1) {
        std::cerr << "====> FORK_SERVER_UNSAFE threads=" << ReadThreadCount() << std::endl;
        return 80;
    }
    struct sigaction reap = {};
    reap.sa_handler = SIG_IGN;
    if (sigaction(SIGCHLD, &reap, nullptr) != 0) {
        return 81;
    }
    std::cout << "FORK_SERVER_READY pid=" << getpid() << " threads=1" << std::endl;
    std::string command;
    while (std::cin >> command) {
        if (command == "QUIT") {
            std::cout << "FORK_SERVER_EXIT pid=" << getpid() << std::endl;
            return 0;
        }
        int index = -1;
        if (command != "SPAWN" || !(std::cin >> index) || index < 0 || index >= 1100 || ReadThreadCount() != 1) {
            return 82;
        }
        const auto directory = root + "/w" + std::to_string(index);
        struct stat info = {};
        if (stat(directory.c_str(), &info) != 0 || !S_ISDIR(info.st_mode)) {
            return 83;
        }
        std::cout.flush();
        std::cerr.flush();
        const auto child = fork();
        if (child < 0) {
            return 84;
        }
        if (child == 0) {
            struct sigaction normal = {};
            normal.sa_handler = SIG_DFL;
            if (sigaction(SIGCHLD, &normal, nullptr) != 0) {
                return 85;
            }
            const int control = open((directory + "/control").c_str(), O_RDWR | O_CLOEXEC);
            const int events = open((directory + "/events.log").c_str(),
                O_WRONLY | O_CREAT | O_TRUNC | O_CLOEXEC, 0600);
            if (control < 0 || events < 0 || dup2(control, STDIN_FILENO) < 0 ||
                dup2(events, STDOUT_FILENO) < 0 || dup2(events, STDERR_FILENO) < 0) {
                return 86;
            }
            close(control);
            close(events);
            // Other descriptors keep normal fork semantics. Do not close a
            // presumed descriptor number: a loaded library may own that FD.
            std::cin.clear();
            std::cout << "FORK_CHILD pid=" << getpid() << " parent=" << getppid() << std::endl;
            return RunClient();
        }
        std::ofstream pidFile(directory + "/pid");
        pidFile << child << std::endl;
        if (!pidFile) {
            return 87;
        }
        std::cout << "FORK_CREATED index=" << index << " pid=" << child << " threads=1" << std::endl;
    }
    return 88;
}

int EmitJobLog(const char *token, const char *mode, const char *status, const char *file)
{
    const OHOS::HiviewDFX::HiLogLabel label { LOG_CORE, 0xD004400, "XtsCapacityServer" };
    std::ifstream input(file);
    std::string line;
    while (std::getline(input, line)) {
        OHOS::HiviewDFX::HiLog::Info(label, "====> token=%{public}s mode=%{public}s status=ROW %{public}s",
            token, mode, line.c_str());
    }
    OHOS::HiviewDFX::HiLog::Info(label, "====> token=%{public}s mode=%{public}s status=%{public}s",
        token, mode, status);
    return 0;
}

int main(int argc, char *argv[])
{
    if (argc == 6 && std::string(argv[1]) == "--emit-log") {
        return EmitJobLog(argv[2], argv[3], argv[4], argv[5]);
    }
    if (argc == 3 && std::string(argv[1]) == "--fork-server") {
        return RunForkServer(argv[2]);
    }
    return RunClient();
}
