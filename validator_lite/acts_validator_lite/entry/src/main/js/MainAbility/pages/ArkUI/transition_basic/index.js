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
import router from '@system.router';

export default {
    data: {
        itemIndex: -1,
        playing001: false,
        playing002: false,
        playing003: false,
        playing004: false,
        playing005: false,
        playing006: false,
        playing007: false,
        playing008: false,
        playing009: false,
        playing010: false,
        playing011: false,
        playing012: false,
        playing013: false,
        rendered001: true,
        rendered002: true,
        rendered003: true,
        rendered004: true,
        rendered005: true,
        rendered006: true,
        rendered007: true,
        rendered008: true,
        rendered009: true,
        rendered010: true,
        rendered011: true,
        rendered012: true,
        rendered013: true,
        pass: 'pass',
        fail: 'fail'
    },

    toggle001() {
        if (this.playing001) {
            this.rendered001 = false;
            this.playing001 = false;
            setTimeout(() => { this.rendered001 = true; }, 50);
        } else {
            this.playing001 = true;
        }
    },

    toggle002() {
        if (this.playing002) {
            this.rendered002 = false;
            this.playing002 = false;
            setTimeout(() => { this.rendered002 = true; }, 50);
        } else {
            this.playing002 = true;
        }
    },

    toggle003() {
        if (this.playing003) {
            this.rendered003 = false;
            this.playing003 = false;
            setTimeout(() => { this.rendered003 = true; }, 50);
        } else {
            this.playing003 = true;
        }
    },

    toggle004() {
        if (this.playing004) {
            this.rendered004 = false;
            this.playing004 = false;
            setTimeout(() => { this.rendered004 = true; }, 50);
        } else {
            this.playing004 = true;
        }
    },

    toggle005() {
        if (this.playing005) {
            this.rendered005 = false;
            this.playing005 = false;
            setTimeout(() => { this.rendered005 = true; }, 50);
        } else {
            this.playing005 = true;
        }
    },

    toggle006() {
        if (this.playing006) {
            this.rendered006 = false;
            this.playing006 = false;
            setTimeout(() => { this.rendered006 = true; }, 50);
        } else {
            this.playing006 = true;
        }
    },

    toggle007() {
        if (this.playing007) {
            this.rendered007 = false;
            this.playing007 = false;
            setTimeout(() => { this.rendered007 = true; }, 50);
        } else {
            this.playing007 = true;
        }
    },

    toggle008() {
        if (this.playing008) {
            this.rendered008 = false;
            this.playing008 = false;
            setTimeout(() => { this.rendered008 = true; }, 50);
        } else {
            this.playing008 = true;
        }
    },

    toggle009() {
        if (this.playing009) {
            this.rendered009 = false;
            this.playing009 = false;
            setTimeout(() => { this.rendered009 = true; }, 50);
        } else {
            this.playing009 = true;
        }
    },

    toggle010() {
        if (this.playing010) {
            this.rendered010 = false;
            this.playing010 = false;
            setTimeout(() => { this.rendered010 = true; }, 50);
        } else {
            this.playing010 = true;
        }
    },

    toggle011() {
        if (this.playing011) {
            this.rendered011 = false;
            this.playing011 = false;
            setTimeout(() => { this.rendered011 = true; }, 50);
        } else {
            this.playing011 = true;
        }
    },

    toggle012() {
        if (this.playing012) {
            this.rendered012 = false;
            this.playing012 = false;
            setTimeout(() => { this.rendered012 = true; }, 50);
        } else {
            this.playing012 = true;
        }
    },

    toggle013() {
        if (this.playing013) {
            this.rendered013 = false;
            this.playing013 = false;
            setTimeout(() => { this.rendered013 = true; }, 50);
        } else {
            this.playing013 = true;
        }
    },

    help() {
        getApp().data.helpData = {
            step: '依次点击每个动画的开始按钮，观察对应方块的属性变化；点击停止后确认恢复初始状态。',
            result: '所有基础动画均符合页面说明。',
            url: 'pages/ArkUI/transition_basic/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },

    changeResult(result) {
        getApp().data.testItems.transition_basic.status = result;
        this.back();
    },

    changeResultPass() {
        this.changeResult(this.pass);
    },

    changeResultFail() {
        this.changeResult(this.fail);
    },

    back() {
        router.replace({
            uri: 'pages/ArkUI/common/index/index',
            params: { itemIndex: this.itemIndex }
        });
    }
}
