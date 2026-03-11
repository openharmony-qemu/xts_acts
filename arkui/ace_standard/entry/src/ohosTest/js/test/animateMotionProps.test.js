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
    describe('toolbarPropsJsTest3', function() {

        var name = 'animateMotion',
            nameA = 'AnimateMotion',
            labelName = 'animateMotion';

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

            expect(obj.$type).assertEqual(labelName)
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
        it('testAdapt001' + nameA + 'AttributeNameProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'AttributeNameProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.attributeNameProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('attributeNameProp')
            expect(obj.$attrs.attributename).assertEqual('x')
            console.info("[" + name + "Props] get attributename value is: " + JSON.stringify(obj.$attrs.attributename));
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
        it('testAdapt002' + nameA + 'AttributeNamePropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'AttributeNamePropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.attributeNamePropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('attributeNamePropNone')
            expect(obj.$attrs.attributename).assertEqual(undefined)
            console.info("[" + name + "Props] get attributename value is: " + JSON.stringify(obj.$attrs.attributename));
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
        it('testAdapt003' + nameA + 'BeginProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'BeginProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.beginProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('beginProp')
            expect(obj.$attrs.begin).assertEqual('1000')
            console.info("[" + name + "Props] get begin value is: " + JSON.stringify(obj.$attrs.begin));
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
        it('testAdapt004' + nameA + 'BeginPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'BeginPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.beginPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('beginPropNone')
            expect(obj.$attrs.begin).assertEqual(undefined)
            console.info("[" + name + "Props] get begin value is: " + JSON.stringify(obj.$attrs.begin));
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
        it('testAdapt005' + nameA + 'DurProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DurProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.durProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('durProp')
            expect(obj.$attrs.dur).assertEqual('1000')
            console.info("[" + name + "Props] get dur value is: " + JSON.stringify(obj.$attrs.dur));
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
        it('testAdapt006' + nameA + 'DurPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DurPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.durPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('durPropNone')
            expect(obj.$attrs.dur).assertEqual(undefined)
            console.info("[" + name + "Props] get dur value is: " + JSON.stringify(obj.$attrs.dur));
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
        it('testAdapt007' + nameA + 'EndProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'EndProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.endProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('endProp')
            expect(obj.$attrs.end).assertEqual('1000')
            console.info("[" + name + "Props] get end value is: " + JSON.stringify(obj.$attrs.end));
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
        it('testAdapt008' + nameA + 'EndPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'EndPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.endPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('endPropNone')
            expect(obj.$attrs.end).assertEqual(undefined)
            console.info("[" + name + "Props] get end value is: " + JSON.stringify(obj.$attrs.end));
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
        it('testAdapt009' + nameA + 'RepeatCountProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RepeatCountProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.repeatCountProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('repeatCountProp')
            expect(obj.$attrs.repeatcount).assertEqual('20')
            console.info("[" + name + "Props] get repeatcount value is: " + JSON.stringify(obj.$attrs.repeatcount));
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
        it('testAdapt010' + nameA + 'RepeatCountPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RepeatCountPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.repeatCountPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('repeatCountPropNone')
            expect(obj.$attrs.repeatcount).assertEqual(undefined)
            console.info("[" + name + "Props] get repeatcount value is: " + JSON.stringify(obj.$attrs.repeatcount));
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
        it('testAdapt011' + nameA + 'FillPropFreeze', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FillPropFreeze START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillPropFreeze);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fillPropFreeze')
            expect(obj.$attrs.fill).assertEqual('freeze')
            console.info("[" + name + "Props] get fill value is: " + JSON.stringify(obj.$attrs.fill));
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
        it('testAdapt012' + nameA + 'FillPropRemove', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FillPropRemove START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillPropRemove);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fillPropRemove')
            expect(obj.$attrs.fill).assertEqual('remove')
            console.info("[" + name + "Props] get fill value is: " + JSON.stringify(obj.$attrs.fill));
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
        it('testAdapt013' + nameA + 'CalcModePropDiscrete', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'CalcModePropDiscrete START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.calcModePropDiscrete);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('calcModePropDiscrete')
            expect(obj.$attrs.calcmode).assertEqual('discrete')
            console.info("[" + name + "Props] get calcmode value is: " + JSON.stringify(obj.$attrs.calcmode));
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
        it('testAdapt014' + nameA + 'CalcModePropLinear', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'CalcModePropLinear START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.calcModePropLinear);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('calcModePropLinear')
            expect(obj.$attrs.calcmode).assertEqual('linear')
            console.info("[" + name + "Props] get calcmode value is: " + JSON.stringify(obj.$attrs.calcmode));
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
        it('testAdapt015' + nameA + 'CalcModePropPaced', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'CalcModePropPaced START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.calcModePropPaced);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('calcModePropPaced')
            expect(obj.$attrs.calcmode).assertEqual('Paced')
            console.info("[" + name + "Props] get calcmode value is: " + JSON.stringify(obj.$attrs.calcmode));
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
        it('testAdapt016' + nameA + 'CalcModePropSpline', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'CalcModePropSpline START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.calcModePropSpline);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('calcModePropSpline')
            expect(obj.$attrs.calcmode).assertEqual('spline')
            console.info("[" + name + "Props] get calcmode value is: " + JSON.stringify(obj.$attrs.calcmode));
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
        it('testAdapt017' + nameA + 'KeyTimesProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeyTimesProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keyTimesProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keyTimesProp')
            expect(obj.$attrs.keytimes).assertEqual('0.3;0.6;0,9')
            console.info("[" + name + "Props] get keytimes value is: " + JSON.stringify(obj.$attrs.keytimes));
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
        it('testAdapt018' + nameA + 'KeyTimesPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeyTimesPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keyTimesPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keyTimesPropNone')
            expect(obj.$attrs.keytimes).assertEqual(undefined)
            console.info("[" + name + "Props] get keytimes value is: " + JSON.stringify(obj.$attrs.keytimes));
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
        it('testAdapt019' + nameA + 'KeySplinesProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeySplinesProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keySplinesProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keySplinesProp')
            expect(obj.$attrs.keysplines).assertEqual('0.5 0 0.5 1')
            console.info("[" + name + "Props] get keysplines value is: " + JSON.stringify(obj.$attrs.keysplines));
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
        it('testAdapt020' + nameA + 'KeySplinesPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeySplinesPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keySplinesPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keySplinesPropNone')
            expect(obj.$attrs.keysplines).assertEqual(undefined)
            console.info("[" + name + "Props] get keysplines value is: " + JSON.stringify(obj.$attrs.keysplines));
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
        it('testAdapt021' + nameA + 'ByProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ByProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.byProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('byProp')
            expect(obj.$attrs.by).assertEqual('1')
            console.info("[" + name + "Props] get by value is: " + JSON.stringify(obj.$attrs.by));
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
        it('testAdapt022' + nameA + 'ByPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ByPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.byPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('byPropNone')
            expect(obj.$attrs.by).assertEqual(undefined)
            console.info("[" + name + "Props] get by value is: " + JSON.stringify(obj.$attrs.by));
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
        it('testAdapt023' + nameA + 'FromProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FromProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fromProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fromProp')
            expect(obj.$attrs.from).assertEqual('10')
            console.info("[" + name + "Props] get from value is: " + JSON.stringify(obj.$attrs.from));
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
        it('testAdapt024' + nameA + 'FromPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FromPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fromPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fromPropNone')
            expect(obj.$attrs.from).assertEqual(undefined)
            console.info("[" + name + "Props] get from value is: " + JSON.stringify(obj.$attrs.from));
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
        it('testAdapt025' + nameA + 'ToProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ToProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.toProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('toProp')
            expect(obj.$attrs.to).assertEqual('10')
            console.info("[" + name + "Props] get to value is: " + JSON.stringify(obj.$attrs.to));
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
        it('testAdapt026' + nameA + 'ToPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ToPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.toPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('toPropNone')
            expect(obj.$attrs.to).assertEqual(undefined)
            console.info("[" + name + "Props] get to value is: " + JSON.stringify(obj.$attrs.to));
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
        it('testAdapt027' + nameA + 'KeyPointsProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeyPointsProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keyPointsProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keyPointsProp')
            expect(obj.$attrs.keypoints).assertEqual('0;0.2;0.4;0.6;0.8;1')
            console.info("[" + name + "Props] get keypoints value is: " + JSON.stringify(obj.$attrs.keypoints));
            done();
        });

        /**
         * @tc.name   testAdapt028
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt028' + nameA + 'KeyPointsPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeyPointsPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keyPointsPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keyPointsPropNone')
            expect(obj.$attrs.keypoints).assertEqual(undefined)
            console.info("[" + name + "Props] get keypoints value is: " + JSON.stringify(obj.$attrs.keypoints));
            done();
        });

        /**
         * @tc.name   testAdapt029
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt029' + nameA + 'PathProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'PathProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pathProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('pathProp')
            expect(obj.$attrs.path).assertEqual('m40,130 c0,-100 160,100 160,0 c0,-100,-160,100 -160,0 z')
            console.info("[" + name + "Props] get path value is: " + JSON.stringify(obj.$attrs.path));
            done();
        });

        /**
         * @tc.name   testAdapt030
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt030' + nameA + 'PathPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'PathPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pathPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('pathPropNone')
            expect(obj.$attrs.path).assertEqual(undefined)
            console.info("[" + name + "Props] get path value is: " + JSON.stringify(obj.$attrs.path));
            done();
        });

        /**
         * @tc.name   testAdapt031
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt031' + nameA + 'RotatePropRotate', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RotatePropRotate START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.rotatePropRotate);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('rotatePropRotate')
            expect(obj.$attrs.rotate).assertEqual('rotate')
            console.info("[" + name + "Props] get rotate value is: " + JSON.stringify(obj.$attrs.rotate));
            done();
        });

        /**
         * @tc.name   testAdapt032
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt032' + nameA + 'RotatePropAutoReverse', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RotatePropAutoReverse START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.rotatePropAutoReverse);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('rotatePropAutoReverse')
            expect(obj.$attrs.rotate).assertEqual('auto-reverse')
            console.info("[" + name + "Props] get rotate value is: " + JSON.stringify(obj.$attrs.rotate));
            done();
        });

        /**
         * @tc.name   testAdapt033
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt033' + nameA + 'RotatePropNumber', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RotatePropNumber START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.rotatePropNumber);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('rotatePropNumber')
            expect(obj.$attrs.rotate).assertEqual('45')
            console.info("[" + name + "Props] get rotate value is: " + JSON.stringify(obj.$attrs.rotate));
            done();
        });
    });
}