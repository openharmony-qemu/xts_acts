/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import process from '@ohos.process';

export function testUptime001() {
    let result1 = process.uptime();
    function sleep(d) {
        while (process.uptime() - result1 <= d) {
            ;
        }
    }
    sleep(3);
    let result2 = process.uptime();
    return (result2 - result1) >= 3;
}

export function testKill006() {
    let pres = process.pid;
    let result = process.kill('17', pres);
    return result;
}

export function testGetEnvironmentlet001() {
    let pri = process.getEnvironmentVar("USER");
    return pri != null;
}

export function testGetEnvironmentlet002() {
    for (let i = 0; i < 3; i++) {
        let pri = process.getEnvironmentVar("PATH");
        if (pri == null) return false;
    }
    return true;
}

export function testGetEnvironmentlet003() {
    for (let i = 0; i < 5; i++) {
        let pri = process.getEnvironmentVar("PATH");
        if (pri == null) return false;
    }
    return true;
}

export function testGetEnvironmentlet004() {
    for (let i = 0; i < 6; i++) {
        let pri = process.getEnvironmentVar("USER");
        if (pri == null) return false;
    }
    return true;
}

export function testGetEnvironmentlet005() {
    for (let i = 0; i < 8; i++) {
        let pri = process.getEnvironmentVar("USER");
        if (pri == null) return false;
    }
    return true;
}

export function testGetEnvironmentlet006() {
    for (let i = 0; i < 100; i++) {
        let pri = process.getEnvironmentVar("i123");
        if (pri != null) return false;
    }
    return true;
}

export function testProcessManagerIsappuid006() {
    try {
        let pro = new process.ProcessManager();
        pro.isAppUid("asdad");
        return "";
    } catch (e) {
        return e.toString();
    }
}

export function testProcessManagerKill006() {
    try {
        let pro = new process.ProcessManager();
        pro.kill("asd", 123);
        return "";
    } catch (e) {
        return e.toString();
    }
}

export function testProcessManagerGetUidForName004() {
    try {
        let pro = new process.ProcessManager();
        pro.getUidForName(12);
        return "";
    } catch (e) {
        return e.toString();
    }
}

export function testProcessManagerGetThreadPriority004() {
    try {
        let pro = new process.ProcessManager();
        pro.getThreadPriority("asdad");
        return "";
    } catch (e) {
        return e.toString();
    }
}

export function testProcessManagerGetSystemConfig006() {
    try {
        let pro = new process.ProcessManager();
        pro.getSystemConfig("asdad");
        return "";
    } catch (e) {
        return e.toString();
    }
}

export function testProcessManagerGetEnvironmentlet001() {
    let pro = new process.ProcessManager();
    let pri = pro.getEnvironmentVar("USER");
    return pri != null;
}

export function testProcessManagerGetEnvironmentlet002() {
    let pro = new process.ProcessManager();
    for (let i = 0; i < 3; i++) {
        let pri = pro.getEnvironmentVar("PATH");
        if (pri == null) return false;
    }
    return true;
}

export function testProcessManagerGetEnvironmentlet003() {
    let pro = new process.ProcessManager();
    for (let i = 0; i < 100; i++) {
        let pri = pro.getEnvironmentVar("i123");
        if (pri != null) return false;
    }
    return true;
}

export function testProcessManagerGetEnvironmentlet004() {
    try {
        let pro = new process.ProcessManager();
        pro.getEnvironmentVar(123);
        return "";
    } catch (e) {
        return e.toString();
    }
}
