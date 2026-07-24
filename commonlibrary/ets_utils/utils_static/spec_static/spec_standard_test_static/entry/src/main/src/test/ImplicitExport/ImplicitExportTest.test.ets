'use static'
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



import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType, } from '../../../../hypium/index';
import { Derived } from "./ImplicitExport1";
import { a, b, c } from "./ImplicitExport4";
import { PI, NAME, FLAG } from "./ImplicitExport2";
import { add, greet } from "./ImplicitExport3";
import { Entity } from "./ImplicitExport6";
import { MyNumber, MyString, MyIntArray } from "./ImplicitExport7";
import { Point } from "./ImplicitExport5";

export default function ImpliciteExportTest() {
    describe('ImpliciteExportTest', (): void => {
        beforeAll(() => {
        })
        beforeEach(async () => {
        })
        /**
         * @tc.number SUB_BUILTINS_ImplicitExport_TEST0001
         * @tc.name ImplicitExportTest0001
         * @tc.desc Test addition operator with numbers
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL1
         */
        it('ImplicitExportTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            expect(a).assertEqual(42);
            expect(b).assertEqual('hello');
            expect(c).assertEqual(true);
        });

        /**
         * @tc.number SUB_BUILTINS_ImplicitExport_TEST0002
         * @tc.name ImplicitExportTest0001
         * @tc.desc Test addition operator with numbers
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL1
         */
        it('ImplicitExportTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            expect(PI).assertEqual(3.14159);
            expect(NAME).assertEqual("ARKTS");
            expect(FLAG).assertEqual(true);
        });

        /**
         * @tc.number SUB_BUILTINS_ImplicitExport_TEST0003
         * @tc.name ImplicitExportTest0003
         * @tc.desc Test addition operator with numbers
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL1
         */
        it('ImplicitExportTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            expect(add(2, 3)).assertEqual(5);
            expect(greet('ARKTS')).assertEqual("HelloARKTS");
            console.log("Test log function");

        });

        /**
        * @tc.number SUB_BUILTINS_ImplicitExport_TEST0004
        * @tc.name ImplicitExportTest0004
        * @tc.desc Test addition operator with numbers
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level LEVEL1
        */
        it('ImplicitExportTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            let PointA: Point = new Point();
            PointA.x = 42;
            expect(PointA.x).assertEqual(42);

        });

        /**
        * @tc.number SUB_BUILTINS_ImplicitExport_TEST0005
        * @tc.name ImplicitExportTest0005
        * @tc.desc Test addition operator with numbers
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level LEVEL1
        */
        it('ImplicitExportTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const entityA = new Entity()
            expect(entityA.getId()).assertEqual(0);
            const entityB = new Entity()
            expect(entityB.serialize()).assertEqual("Entity:0");
        });

        /**
        * @tc.number SUB_BUILTINS_ImplicitExport_TEST0006
        * @tc.name ImplicitExportTest0006
        * @tc.desc Test addition operator with numbers
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level LEVEL1
        */
        it('ImplicitExportTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            let derived = new Derived();
            derived.value = 42
            expect(derived.getValue()).assertEqual(42);
        });

        /**
        * @tc.number SUB_BUILTINS_ImplicitExport_TEST0007
        * @tc.name ImplicitExportTest0007
        * @tc.desc Test addition operator with numbers
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level LEVEL1
        */
        it('ImplicitExportTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            let num1: MyNumber = 10;
            let num2: MyNumber = 20.5;
            expect(num1 + num2).assertEqual(30.5);
            let str: MyString = 'Hello';
            expect(str).assertEqual('Hello');
            let arr: MyIntArray = [1, 2, 3]
            expect(arr.length).assertEqual(3);
        });

    })
} 