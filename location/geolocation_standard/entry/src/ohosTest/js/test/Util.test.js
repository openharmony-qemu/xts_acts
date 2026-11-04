/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import access from '@ohos.bluetooth.access';
import { Driver, ON } from '@ohos.UiTest';

const BT_STATE_OFF = access.BluetoothState.STATE_OFF;
const BT_STATE_TURNING_ON = access.BluetoothState.STATE_TURNING_ON;
const BT_STATE_ON = access.BluetoothState.STATE_ON;
const BT_STATE_TURNING_OFF = access.BluetoothState.STATE_TURNING_OFF;
const BT_STATE_BLE_TURNING_ON = access.BluetoothState.STATE_BLE_TURNING_ON;
const BT_STATE_BLE_ON = access.BluetoothState.STATE_BLE_ON;
const BT_STATE_BLE_TURNING_OFF = access.BluetoothState.STATE_BLE_TURNING_OFF;

const BT_STATE_UNKNOWN = -1;
const WAIT_TIMEOUT = 8000;

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function getBtState() {
    try {
        return access.getState();
    } catch (err) {
        console.info('[bt_util] getState err: ' + JSON.stringify(err));
        return BT_STATE_UNKNOWN;
    }
}

async function clickDialogButton(text) {
    try {
        let driver = Driver.create();
        for (let i = 0; i < 3; i++) {
            await sleep(1000);
            let button = await driver.findComponent(ON.text(text));
            if (button) {
                await button.click();
                console.info('[bt_util] click dialog button ' + text + ' success');
                return true;
            }
        }
        console.info('[bt_util] dialog button ' + text + ' not found');
    } catch (err) {
        console.info('[bt_util] click dialog button ' + text + ' err: ' + JSON.stringify(err));
    }
    return false;
}

function waitBtState(targets, timeout) {
    return new Promise((resolve) => {
        let start = Date.now();
        let timer = null;
        function onStateChange(next) {
            console.info('[bt_util] stateChange: ' + next);
            check(next);
        }
        function finish(val) {
            if (timer !== null) {
                clearInterval(timer);
            }
            try {
                access.off('stateChange', onStateChange);
            } catch (err) {
                console.info('[bt_util] off stateChange err: ' + JSON.stringify(err));
            }
            resolve(val);
        }
        function check(cur) {
            if (targets.indexOf(cur) !== -1) {
                finish(cur);
                return true;
            }
            return false;
        }
        if (check(getBtState())) {
            return;
        }
        try {
            access.on('stateChange', onStateChange);
        } catch (err) {
            console.info('[bt_util] on stateChange err: ' + JSON.stringify(err));
        }
        timer = setInterval(() => {
            if (check(getBtState())) {
                return;
            }
            if (Date.now() - start >= timeout) {
                console.info('[bt_util] waitBtState timeout, targets: ' + JSON.stringify(targets));
                finish(getBtState());
            }
        }, 500);
    });
}

async function tryToDisableBt() {
    let state = getBtState();
    console.info('[bt_util] tryToDisableBt current state: ' + state);
    if (state === BT_STATE_OFF) {
        console.info('[bt_util] bluetooth already off');
        return;
    }
    if (state === BT_STATE_TURNING_OFF || state === BT_STATE_BLE_TURNING_OFF) {
        state = await waitBtState([BT_STATE_OFF], WAIT_TIMEOUT);
        console.info('[bt_util] tryToDisableBt wait turning-off done, state: ' + state);
        return;
    }
    if (state === BT_STATE_TURNING_ON || state === BT_STATE_BLE_TURNING_ON) {
        state = await waitBtState([BT_STATE_ON, BT_STATE_BLE_ON], WAIT_TIMEOUT);
        console.info('[bt_util] tryToDisableBt wait turning-on done, state: ' + state);
    }
    try {
        access.disableBluetooth();
        console.info('[bt_util] disableBluetooth called');
    } catch (err) {
        console.info('[bt_util] disableBluetooth err: ' + JSON.stringify(err));
    }
    await clickDialogButton('关闭');
    state = await waitBtState([BT_STATE_OFF], WAIT_TIMEOUT);
    console.info('[bt_util] tryToDisableBt final state: ' + state);
}

async function tryToEnableBt() {
    let state = getBtState();
    console.info('[bt_util] tryToEnableBt current state: ' + state);
    if (state === BT_STATE_ON) {
        console.info('[bt_util] bluetooth already on');
        return;
    }
    if (state === BT_STATE_TURNING_ON || state === BT_STATE_BLE_TURNING_ON) {
        state = await waitBtState([BT_STATE_ON], WAIT_TIMEOUT);
        console.info('[bt_util] tryToEnableBt wait turning-on done, state: ' + state);
        return;
    }
    try {
        access.enableBluetooth();
        console.info('[bt_util] enableBluetooth called');
    } catch (err) {
        console.info('[bt_util] enableBluetooth err: ' + JSON.stringify(err));
    }
    await clickDialogButton('开启');
    state = await waitBtState([BT_STATE_ON], WAIT_TIMEOUT);
    console.info('[bt_util] tryToEnableBt final state: ' + state);
}

export { tryToDisableBt, tryToEnableBt };
