/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import { describe, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium';


export default function undo() {
    describe('toolbarPropsJsTest7', function() {

        var name = 'toolbar',
            nameA = 'Toolbar';

        async function sleep(time) {
            return new Promise((resolve, reject) => {
                setTimeout(() => {
                    resolve()
                }, time)
            }).then(() => {
                console.info(`sleep ${time} over...`)
            })
        }

        async function backToIndex() {
            let backToIndexPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.back({
                        uri: 'pages/index/index'
                    });
                    resolve();
                }, 500);
            });
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear();
                    resolve();
                }, 500);
            });
            await backToIndexPromise.then(() => {
                return clearPromise;
            });
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[' + name + 'PropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/' + name + '/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push " + name + "Props page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push " + name + "Props page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[' + name + 'PropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   test' + nameA + 'IdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('test' + nameA + 'IdProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'IdProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testAdapt001
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt001' + nameA + 'ClassProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClassProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testAdapt002
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt002' + nameA + 'ClassPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClassPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[" + name + "Props] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testAdapt003
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt003' + nameA + 'RefProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RefProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testAdapt004
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt004' + nameA + 'RefPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RefPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[" + name + "Props] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testAdapt005
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt005' + nameA + 'DisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DisabledPropTrue START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testAdapt006
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt006' + nameA + 'DisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DisabledPropFalse START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testAdapt007
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt007' + nameA + 'DisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DisabledPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testAdapt008
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt008' + nameA + 'FocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FocusablePropTrue START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testAdapt009
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt009' + nameA + 'FocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FocusablePropFalse START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testAdapt010
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt010' + nameA + 'FocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FocusablePropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testAdapt011
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt011' + nameA + 'DataProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DataProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataDiv).assertEqual(undefined);
            console.info("[" + name + "Props] get dataDiv value is: " + JSON.stringify(obj.$attrs.dataDiv));
            done();
        });

        /**
         * @tc.name   testAdapt012
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt012' + nameA + 'DataPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DataPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataDiv).assertEqual(undefined)
            console.info("[" + name + "Props] get dataDiv value is: " + JSON.stringify(obj.$attrs.dataDiv));
            done();
        });

        /**
         * @tc.name   testAdapt013
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt013' + nameA + 'ClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClickEffectPropSmall START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testAdapt014
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt014' + nameA + 'ClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClickEffectPropMedium START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testAdapt015
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt015' + nameA + 'ClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClickEffectPropLarge START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testAdapt016
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt016' + nameA + 'ClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClickEffectPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[" + name + "Props] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testAdapt017
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt017' + nameA + 'DirPropRtl', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DirPropRtl START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testAdapt018
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt018' + nameA + 'DirPropLtr', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DirPropLtr START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testAdapt019
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt019' + nameA + 'DirPropAuto', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DirPropAuto START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testAdapt020
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt020' + nameA + 'DirPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DirPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testAdapt021
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt021' + nameA + 'ForPropNull', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ForPropNull START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[" + name + "Props] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testAdapt022
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt022' + nameA + 'ForPropOne', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ForPropOne START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[" + name + "Props] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testAdapt023
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt023' + nameA + 'ForPropThree', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ForPropThree START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[" + name + "Props] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testAdapt024
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt024' + nameA + 'IfPropTrue', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'IfPropTrue START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[" + name + "Props] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testAdapt025
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt025' + nameA + 'ShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropTrue START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[" + name + "Props] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testAdapt026
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt026' + nameA + 'ShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropFalse START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[" + name + "Props] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testAdapt027
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt027' + nameA + 'ShowPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(name)
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[" + name + "Props] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });
    });
}