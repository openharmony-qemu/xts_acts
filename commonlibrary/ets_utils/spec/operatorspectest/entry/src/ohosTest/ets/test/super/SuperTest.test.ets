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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import * as mis from './SuperResource';

interface GeneratedObjectLiteralInterface_1 {
  a: number;
  b: string;
}

interface GeneratedObjectLiteralInterface_2 {
  port: number;
  debug: boolean;
}

export default function SuperTest() {
  describe('SuperTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0110
     * @tc.name testSuper001
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dog = new mis.Dog001()
      expect(dog.name).assertEqual('unknown')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0120
     * @tc.name testSuper002
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dog = new mis.Dog002('Rex', 3, 'Labrador')
      expect(dog.name).assertEqual('Rex')
      expect(dog.age).assertEqual(3)
      expect(dog.breed).assertEqual('Labrador')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0130
     * @tc.name testSuper003
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new mis.Child003(1, 'tag')
      expect(c1.label).assertEqual('tag')
      let c2 = new mis.Child003(2)
      expect(c2.label).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0140
     * @tc.name testSuper005
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child005({ host: 'localhost', port: 8080 })
      expect(c.config.host).assertEqual('localhost')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0150
     * @tc.name testSuper006
     * @tc.desc Verify ABC super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new mis.C006(1, 2, 3)
      expect(obj.a).assertEqual(1)
      expect(obj.b).assertEqual(2)
      expect(obj.c).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0160
     * @tc.name testSuper007
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box = new mis.NumberBox007(42)
      expect(box.value).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0170
     * @tc.name testSuper008
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dog = new mis.Dog008()
      expect(dog.bark()).assertEqual('generic sound - Woof')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0180
     * @tc.name testSuper009
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dog = new mis.Dog009()
      expect(dog.speak()).assertEqual('generic Woof')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0190
     * @tc.name testSuper010
     * @tc.desc Verify super.method(args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc = new mis.AdvCalculator010()
      expect(calc.compute(3, 4)).assertEqual(14)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0200
     * @tc.name testSuper011
     * @tc.desc Verify supergettersetter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child011()
      c.value = 5
      expect(c.value).assertEqual(105)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0210
     * @tc.name testSuper012
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.C012()
      expect(c.greet()).assertEqual('A012B012C012')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0220
     * @tc.name testSuper014
     * @tc.desc Verify static super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(mis.Child014.version()).assertEqual('1.0-child')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0230
     * @tc.name testSuper015
     * @tc.desc Verify staticsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(mis.Child015.getCount()).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0240
     * @tc.name testSuper017
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child017().show()).assertEqual('base')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0250
     * @tc.name testSuper018
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child018()
      expect(c.testArrow()).assertEqual('hello')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0260
     * @tc.name testSuper019
     * @tc.desc Verify asyncawait super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child019()
      c.fetchData().then(r => expect(r).assertEqual('data-extended'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0270
     * @tc.name testSuper020
     * @tc.desc Verify super()this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child020().checkThis()).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0280
     * @tc.name testSuper021
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child021().getValue()).assertEqual(43)
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0290
     * @tc.name testSuper024
     * @tc.desc Verify super.method()null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child024().getOrNull()).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0300
     * @tc.name testSuper025
     * @tc.desc Verify super.method()undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child025().getUndef()).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0310
     * @tc.name testSuper026
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child026().getItems().length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0320
     * @tc.name testSuper027
     * @tc.desc Verify super.method()falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child027().getCount()).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0330
     * @tc.name testSuper028
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child028().checkType()).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0340
     * @tc.name testSuper029
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let info = new mis.Child029().getInfo()
      expect(info.id).assertEqual(1)
      expect(info.name).assertEqual('base')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0350
     * @tc.name testSuper030
     * @tc.desc Verify super.method()number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child030().getMax()).assertEqual(Number.MAX_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0360
     * @tc.name testSuper031
     * @tc.desc Verify super.method()Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new mis.Child031().getValue().then(v => expect(v).assertEqual(42))
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0370
     * @tc.name testSuper037
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new mis.Child037(-1)
        expect().assertFail()
      } catch (error) {
        let e = error as Error
        expect(e.message).assertEqual('value cannot be negative')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0380
     * @tc.name testSuper038
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new mis.Child038().divide(10, 0)
        expect().assertFail()
      } catch (error) {
        let e = error as Error
        expect(e.message).assertEqual('division by zero')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0390
     * @tc.name testSuper041
     * @tc.desc Verify finallysuper.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new mis.Child041().cleanup()
      } catch (e) {
        expect().assertFail()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0400
     * @tc.name testSuper042
     * @tc.desc Verify Error super(message)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new mis.AppError042('not found', 404)
      } catch (error) {
        let e = error as mis.AppError042
        expect(e.message).assertEqual('not found')
        expect(e.code).assertEqual(404)
        expect(e.name).assertEqual('AppError042')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0410
     * @tc.name testSuper046
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p = new mis.Page046()
      p.onCreate()
      p.onDestroy()
      expect(p.log[0]).assertEqual('base:onCreate')
      expect(p.log[1]).assertEqual('page:onCreate')
      expect(p.log[2]).assertEqual('page:onDestroy')
      expect(p.log[3]).assertEqual('base:onDestroy')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0420
     * @tc.name testSuper047
     * @tc.desc Verify CRUD super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repo = new mis.UserRepository047()
      repo.save({ id: 1, name: 'Alice' })
      expect(repo.findByName('Alice')?.id).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0430
     * @tc.name testSuper048
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f = new mis.TimestampedFormatter048()
      let out = f.format('INFO', 'started')
      expect(out.includes('[INFO] started')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0440
     * @tc.name testSuper049
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new mis.AdminMiddleware049()
      expect(m.handle({ token: 'abc', user: 'root', role: 'admin' })).assertTrue()
      expect(m.handle({ token: 'abc', user: 'root', role: 'user' })).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0450
     * @tc.name testSuper050
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new mis.PasswordValidator050()
      let errs = v.validate('abc')
      expect(errs.includes('too short')).assertTrue()
      expect(errs.includes('need uppercase')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0460
     * @tc.name testSuper051
     * @tc.desc Verify EventEmitteron/emit super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let store = new mis.Store051()
      let received: Object = ''
      store.on('name', (v: Object) => {
        received = v
      })
      store.setState('name', 'Alice')
      expect(received).assertEqual('Alice')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0470
     * @tc.name testSuper052
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cfg = new mis.ProductionDbConfig052()
      expect(cfg.get('host')).assertEqual('prod-db.local')
      expect(cfg.get('port')).assertEqual(6543)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0480
     * @tc.name testSuper053
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc = new mis.LuxuryTaxCalculator053(0.05, 10000)
      let tax = calc.calculate(15000)
      expect(tax).assertEqual(1500 + 750 + 1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0490
     * @tc.name testSuper054
     * @tc.desc Verify transition super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sm = new mis.LoggingStateMachine054()
      expect(sm.transition('running')).assertEqual('running')
      expect(sm.transition('stopped')).assertEqual('stopped')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0500
     * @tc.name testSuper055
     * @tc.desc Verify override super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child055().greet()).assertEqual('hello from child')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0510
     * @tc.name testSuper059
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = new mis.Entity059(1, 'test')
      expect(e.serialize()).assertEqual('{"id":1,"name":"test"}')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0520
     * @tc.name testSuper060
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sc = new mis.SortedCollection060<number>()
      sc.add(3);
      sc.add(1);
      sc.add(2)
      expect(sc.getAll()[0]).assertEqual(1)
      expect(sc.getAll()[1]).assertEqual(2)
      expect(sc.getAll()[2]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0530
     * @tc.name testSuper063
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Concrete063()
      c.operation()
      expect(c.log[0]).assertEqual('Base063')
      expect(c.log[1]).assertEqual('MixinA063')
      expect(c.log[2]).assertEqual('MixinB063')
      expect(c.log[3]).assertEqual('Concrete063')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0540
     * @tc.name testSuper064
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.B064(5).v).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0550
     * @tc.name testSuper065
     * @tc.desc Verify 5 super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.L5065().v).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0560
     * @tc.name testSuper066
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child066()
      expect(c.getChildValue()).assertEqual('child')
      expect(c.getBaseValue()).assertEqual('child')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0570
     * @tc.name testSuper067
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Leaf067().shared()).assertEqual('leaf-mid-shared')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0580
     * @tc.name testSuper068
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child068()
      expect(c.v).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0590
     * @tc.name testSuper069
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child069().name).assertEqual('default')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0600
     * @tc.name testSuper070
     * @tc.desc Verify super()this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child070(3, 4).sum()).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0610
     * @tc.name testSuper071
     * @tc.desc Verify super.method()this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child071()
      c.init()
      expect(c.ready).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0620
     * @tc.name testSuper072
     * @tc.desc Verify super(null)null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new mis.Child072(null)
        expect().assertFail()
      } catch (error) {
        let e = error as Error
        expect(e.message).assertEqual('name required')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0630
     * @tc.name testSuper073
     * @tc.desc Verify super(undefined)undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child073()
      expect(c.value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0640
     * @tc.name testSuper074
     * @tc.desc Verify super('')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new mis.Child074('')
        expect().assertFail()
      } catch (error) {
        let e = error as Error
        expect(e.message).assertEqual('empty name')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0650
     * @tc.name testSuper075
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = 'x'.repeat(1001)
      try {
        new mis.Child075(longStr)
        expect().assertFail()
      } catch (error) {
        let e = error as Error
        expect(e.message).assertEqual('data too long')
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0660
     * @tc.name testSuper077
     * @tc.desc Verify superXSS/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child077('<script>alert(1)</script>')
      expect(c.sanitized()).assertEqual('&lt;script>alert(1)&lt;/script>')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0670
     * @tc.name testSuper078
     * @tc.desc Verify superprotected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child078().check(5)).assertTrue()
      expect(new mis.Child078().check(-1)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0680
     * @tc.name testSuper079
     * @tc.desc Verify superreadonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child079(42).getId()).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0690
     * @tc.name testSuper081
     * @tc.desc Verify superprotected getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child081().getCount()).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0700
     * @tc.name testSuper082
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child082('abc').value).assertEqual('abc')
      expect(new mis.Child082(123).value).assertEqual(123)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0710
     * @tc.name testSuper083
     * @tc.desc Verify super keyword test case 83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: GeneratedObjectLiteralInterface_1 = { a: 1, b: 'x' }
      let c = new mis.Child083(res)
      expect(c.data.a).assertEqual(1)
      expect(c.data.b).assertEqual('x')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0720
     * @tc.name testSuper084
     * @tc.desc Verify super keyword test case 84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child084('info').level).assertEqual('info')
      expect(new mis.Child084('error').level).assertEqual('error')
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0730
     * @tc.name testSuper086
     * @tc.desc Verify super keyword test case 86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child086(['age', 30])
      expect(c.pair[0]).assertEqual('age')
      expect(c.pair[1]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0740
     * @tc.name testSuper087
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child087()
      expect(c.nextItem(0)).assertEqual(10)
      expect(c.nextItem(2)).assertEqual(30)
      expect(c.nextItem(5)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0750
     * @tc.name testSuper088
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child088().accumulate(1, 5)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0760
     * @tc.name testSuper089
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child089().reverse([1, 2, 3])
      expect(r[0]).assertEqual(4)
      expect(r[1]).assertEqual(3)
      expect(r[2]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0770
     * @tc.name testSuper090
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child090().chunk([1, 2, 3, 4], 2)
      expect(r[0][0]).assertEqual(2)
      expect(r[1][1]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0780
     * @tc.name testSuper091
     * @tc.desc Verify Array super(...items)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new mis.MyArray091(1, 2, 3, 4)
      expect(arr.length).assertEqual(4)
      expect(arr.sum()).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0790
     * @tc.name testSuper092
     * @tc.desc Verify Error super(message)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = new mis.AppError092('fail', 500)
      expect(e.message).assertEqual('fail')
      expect(e.code).assertEqual(500)
      expect(e instanceof Error).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0800
     * @tc.name testSuper093
     * @tc.desc Verify Map super.set/get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new mis.CountedMap093()
      m.inc('a')
      m.inc('a')
      m.inc('a')
      expect(m.get('a')).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0810
     * @tc.name testSuper094
     * @tc.desc Verify Set super.add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new mis.ObservableSet094<number>()
      s.add(1)
      s.add(2)
      s.add(1)
      expect(s.size).assertEqual(2)
      expect(s.opCount).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0820
     * @tc.name testSuper095
     * @tc.desc Verify RegExp supertag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.TaggedRegExp095('^abc', 'prefix')
      expect(r.tag).assertEqual('prefix')
      expect(r.testTag('abcdef')).assertTrue()
      expect(r.testTag('xyz')).assertFalse()
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0830
     * @tc.name testSuper098
     * @tc.desc Verify super.build
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q = new mis.WhereBuilder098().select('*').where('id=1').build()
      expect(q).assertEqual('SELECT * WHERE id=1;')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0840
     * @tc.name testSuper100
     * @tc.desc Verify super.execute/undo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.LoggedCommand100()
      c.execute()
      c.undo()
      expect(c.log[0]).assertEqual('exec')
      expect(c.log[1]).assertEqual('undo')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0850
     * @tc.name testSuper101
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new mis.Adapter101()
      expect(a.request()).assertEqual('adapted:specific')
      expect(a.specificRequest()).assertEqual('specific')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0860
     * @tc.name testSuper102
     * @tc.desc Verify superoperation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new mis.ColorDecorator102()
      expect(d.operation()).assertEqual('<red>[base]</red>')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0870
     * @tc.name testSuper103
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child103().test()).assertEqual('hi')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0880
     * @tc.name testSuper104
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child104().status()).assertEqual('ready')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0890
     * @tc.name testSuper105
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child105().describe()).assertEqual('child of Base105')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0900
     * @tc.name testSuper106
     * @tc.desc Verify super.method()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child106()
      expect(c.getValue()).assertEqual(150)
      expect(c.doubled()).assertEqual(200)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0910
     * @tc.name testSuper107
     * @tc.desc Verify super.tag()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Leaf107().tag()).assertEqual('LMB')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0920
     * @tc.name testSuper108
     * @tc.desc Verify toStringsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child108().toString()).assertEqual('Child108(Base108)')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0930
     * @tc.name testSuper109
     * @tc.desc Verify valueOfsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child109().valueOf()).assertEqual(50)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0940
     * @tc.name testSuper110
     * @tc.desc Verify toJSONsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child110().toJSON().includes('"type":"child"')).assertTrue()
      expect(new mis.Child110().toJSON().includes('"type":"base"')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0950
     * @tc.name testSuper111
     * @tc.desc Verify 10super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.L10111().v).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0960
     * @tc.name testSuper112
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.CachedCalculator112()
      expect(c.sum(100)).assertEqual(5050)
      expect(c.sum(100)).assertEqual(5050)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0970
     * @tc.name testSuper113
     * @tc.desc Verify super.transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child113().batch([1, 2, 3])
      expect(r[0]).assertEqual(2)
      expect(r[1]).assertEqual(5)
      expect(r[2]).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0980
     * @tc.name testSuper114
     * @tc.desc Verify super this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new mis.Child114()
      let b = new mis.Child114()
      a.setParent(b)
      b.setParent(a)
      expect(a.parent).assertEqual(b)
      expect(b.parent).assertEqual(a)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_0990
     * @tc.name testSuper115
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child115().process('ABC')).assertEqual('abc')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1000
     * @tc.name testSuper116
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child116()
      expect(c.greet('Sam')).assertEqual('Hello Sam!')
      expect(c.greetTitle('Sam', 'Dr.')).assertEqual('Dr. Sam!')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1010
     * @tc.name testSuper117
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child117(5).label).assertEqual('item-5')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1020
     * @tc.name testSuper118
     * @tc.desc Verify super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = new mis.Child118()
      let c2 = new mis.Child118()
      expect(c1.id).assertEqual(0)
      expect(c2.id).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1030
     * @tc.name testSuper119
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child119().greeting).assertEqual('hi')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1040
     * @tc.name testSuper120
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new mis.Item120(1)
      let b = new mis.Item120(5)
      expect(a.compareTo(b)).assertEqual(-4)
      expect(a.print()).assertEqual('Item120#1')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1050
     * @tc.name testSuper121
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child121().serialize()).assertEqual('base:child')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1060
     * @tc.name testSuper122
     * @tc.desc Verify super.fetch().then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new mis.Child122().fetch().then(r => expect(r).assertEqual('data+child'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1070
     * @tc.name testSuper123
     * @tc.desc Verify Promise.allsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new mis.Child123().fetchAll().then(r => {
        expect(r[0][0]).assertEqual('Alice')
        expect(r[1][0]).assertEqual('p1')
      })
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1080
     * @tc.name testSuper124
     * @tc.desc Verify asyncawaitsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new mis.Child124().run().then(r => expect(r).assertEqual('s1-s2'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1090
     * @tc.name testSuper125
     * @tc.desc Verify readonly super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child125().getVersion()).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1100
     * @tc.name testSuper128
     * @tc.desc Verify superNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child128(NaN)
      expect(c.isValid()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1110
     * @tc.name testSuper129
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child129(Infinity).isFinite()).assertFalse()
      expect(new mis.Child129(-Infinity).isFinite()).assertFalse()
      expect(new mis.Child129(100).isFinite()).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1120
     * @tc.name testSuper130
     * @tc.desc Verify super 0-0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child130(-0).isNegativeZero()).assertTrue()
      expect(new mis.Child130(0).isNegativeZero()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1130
     * @tc.name testSuper131
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child131(Number.MIN_VALUE).isMinPositive()).assertTrue()
      expect(new mis.Child131(0).isMinPositive()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1140
     * @tc.name testSuper132
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child132(Number.MAX_SAFE_INTEGER).isSafe()).assertTrue()
      expect(new mis.Child132(Number.MAX_SAFE_INTEGER + 1).isSafe()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1150
     * @tc.name testSuper133
     * @tc.desc Verify superunicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child133('Hello\u4e16\u754c')
      expect(c.length()).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1160
     * @tc.name testSuper134
     * @tc.desc Verify superemoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child134('A😀B')
      expect(c.charCount()).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1170
     * @tc.name testSuper135
     * @tc.desc Verify super//
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child135('   \t\n').isEmpty()).assertTrue()
      expect(new mis.Child135(' x ').isEmpty()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1180
     * @tc.name testSuper136
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big = 'x'.repeat(10000)
      let r = new mis.Child136(big).truncate(5)
      expect(r).assertEqual('xxxxx...')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1190
     * @tc.name testSuper137
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.Child137(1, 2, 3)
      expect(c.nums.length).assertEqual(3)
      expect(c.nums[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1200
     * @tc.name testSuper140
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child140().process({ x: 3, y: 4 })).assertEqual(14)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1210
     * @tc.name testSuper141
     * @tc.desc Verify super typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child141().getNumber()).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1220
     * @tc.name testSuper142
     * @tc.desc Verify super status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child142().getData()).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1230
     * @tc.name testSuper143
     * @tc.desc Verify superObjectinstanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child143().asRecord()
      expect(r !== null).assertTrue()
      expect(r!['value']).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1240
     * @tc.name testSuper144
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child144().double([1, 2, 3])
      expect(r[0]).assertEqual(2)
      expect(r[2]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1250
     * @tc.name testSuper145
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = new mis.Child145().multiplier(10)
      expect(fn(5)).assertEqual(51)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1260
     * @tc.name testSuper146
     * @tc.desc Verify mapsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child146().batch([-1, 2, -3])
      expect(r[0]).assertEqual(0)
      expect(r[1]).assertEqual(2)
      expect(r[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1270
     * @tc.name testSuper147
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = new mis.Child147().getter()
      expect(fn()).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1280
     * @tc.name testSuper148
     * @tc.desc Verify supermap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child148().transform([1, 2, 3])
      expect(r[0]).assertEqual(4)
      expect(r[2]).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1290
     * @tc.name testSuper149
     * @tc.desc Verify superfilter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child149().filterPositive([-1, 5, 15, 3])
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual(5)
      expect(r[1]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1300
     * @tc.name testSuper150
     * @tc.desc Verify super.sortAsc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child150().sortDesc([3, 1, 2])
      expect(r[0]).assertEqual(3)
      expect(r[2]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1310
     * @tc.name testSuper151
     * @tc.desc Verify super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asc = new mis.Child151().sortByAge(mis.data)
      let desc = new mis.Child151().sortByAgeDesc(mis.data)
      expect(asc[0].age).assertEqual(20)
      expect(desc[0].age).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1320
     * @tc.name testSuper152
     * @tc.desc Verify push/popsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new mis.LoggingStack152()
      s.push(1)
      s.push(2)
      s.pop()
      expect(s.size()).assertEqual(1)
      expect(s.log[0]).assertEqual('push:1')
      expect(s.log[1]).assertEqual('push:2')
      expect(s.log[2]).assertEqual('pop:2')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1330
     * @tc.name testSuper153
     * @tc.desc Verify enqueuesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q = new mis.BoundedQueue153(2)
      q.enqueue(1)
      q.enqueue(2)
      try {
        q.enqueue(3)
        expect().assertFail()
      } catch (error) {
        let e = error as Error
        expect(e.message).assertEqual('full')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1340
     * @tc.name testSuper154
     * @tc.desc Verify supervalue/next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = new mis.TrackedNode154(5)
      expect(n.toString()).assertEqual('Tracked:Node154(5)')
      expect(n.value).assertEqual(5)
      expect(n.visited).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1350
     * @tc.name testSuper155
     * @tc.desc Verify supercount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new mis.NamedTreeNode155('root')
      root.add(new mis.NamedTreeNode155('a'))
      root.add(new mis.NamedTreeNode155('b'))
      expect(root.count()).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1360
     * @tc.name testSuper156
     * @tc.desc Verify superconnect/degree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new mis.DirectedNode156('A')
      let b = new mis.DirectedNode156('B')
      a.connect(b)
      expect(a.degree()).assertEqual(1)
      expect(b.degree()).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1370
     * @tc.name testSuper157
     * @tc.desc Verify LRUget/setsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cache = new mis.LRUCache157(2)
      cache.set('a', 1)
      cache.set('b', 2)
      cache.set('c', 3)
      expect(cache.get('a')).assertUndefined()
      expect(cache.get('b')).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1380
     * @tc.name testSuper160
     * @tc.desc Verify schedulesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new mis.CountedDebouncer160()
      d.schedule(() => {
      }, 100)
      d.schedule(() => {
      }, 100)
      d.schedule(() => {
      }, 100)
      expect(d.count).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1390
     * @tc.name testSuper161
     * @tc.desc Verify tryCallsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new mis.LoggedThrottler161()
      t.tryCall(() => {
      }, 1000)
      t.tryCall(() => {
      }, 1000)
      expect(t.calls).assertEqual(1)
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1400
     * @tc.name testSuper163
     * @tc.desc Verify open/closesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.ManagedResource163()
      expect(r.isOpen()).assertFalse()
      r.open()
      expect(r.isOpen()).assertTrue()
      r.close()
      expect(r.isOpen()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1410
     * @tc.name testSuper164
     * @tc.desc Verify acquire/releasesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h = new mis.OrderedHandler164()
      h.acquire()
      h.release()
      expect(h.log[0]).assertEqual('acquire')
      expect(h.log[1]).assertEqual('after-acquire')
      expect(h.log[2]).assertEqual('before-release')
      expect(h.log[3]).assertEqual('release')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1420
     * @tc.name testSuper165
     * @tc.desc Verify disconnectsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.SafeConnection165()
      c.disconnect()
      expect(c.isConnected()).assertFalse()
      c.connect()
      c.disconnect()
      expect(c.isConnected()).assertFalse()
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1430
     * @tc.name testSuper169
     * @tc.desc Verify runsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let token = new mis.CancellationToken169()
      let task = new mis.LoggedTask169(token)
      expect(task.run()).assertEqual('log:completed')
      token.cancel()
      expect(task.run()).assertEqual('log:cancelled')
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1440
     * @tc.name testSuper171
     * @tc.desc Verify deepsuperJSON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let copy = new mis.TypedDeepCloner171().deep(mis.original) as Record<string, Object>
      expect(copy['a']).assertEqual(1)
      let b = copy['b'] as Record<string, Object>
      expect(b['nested']).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1450
     * @tc.name testSuper172
     * @tc.desc Verify mergesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.Child172().merge({ a: 1 }, { a: 2, b: 3 })
      expect(r['a']).assertEqual(2)
      expect(r['b']).assertEqual(3)
      expect(r['merged']).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1460
     * @tc.name testSuper173
     * @tc.desc Verify equalssuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = 'hello'
      expect(new mis.Child173().equals(s, s)).assertTrue()
      expect(new mis.Child173().equals('a', 'b')).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1470
     * @tc.name testSuper174
     * @tc.desc Verify valueEqualsuperNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.Child174().valueEqual(1, 1)).assertTrue()
      expect(new mis.Child174().valueEqual(NaN, NaN)).assertTrue()
      expect(new mis.Child174().valueEqual(1, 2)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1480
     * @tc.name testSuper175
     * @tc.desc Verify equalssuperid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new mis.TrackedEntity175(1)
      let b = new mis.TrackedEntity175(1)
      let c = new mis.TrackedEntity175(2)
      expect(a.equals(b)).assertTrue()
      expect(a.equals(c)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1490
     * @tc.name testSuper176
     * @tc.desc Verify mergesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.ChildConfig176().merge({ port: 9090 })
      expect(r['host']).assertEqual('localhost')
      expect(r['port']).assertEqual(9090)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1500
     * @tc.name testSuper177
     * @tc.desc Verify mergesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.StrictConfig177().merge({ a: 1 }, { a: 2, b: 3 }, { b: 4, c: 5 })
      expect(r['a']).assertEqual(2)
      expect(r['b']).assertEqual(4)
      expect(r['c']).assertEqual(5)
      expect(r['source']).assertEqual('strict')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1510
     * @tc.name testSuper178
     * @tc.desc Verify applysuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.PercentDiscount178(0.1).apply(100)).assertEqual(90)
      expect(new mis.FixedDiscount178(30).apply(100)).assertEqual(70)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1520
     * @tc.name testSuper180
     * @tc.desc Verify handlesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chain = new mis.AuthHandler180()
      chain.setNext(new mis.LogHandler180())
      expect(chain.handle('auth')).assertEqual('auth-ok')
      expect(chain.handle('log')).assertEqual('log-ok')
      expect(chain.handle('other')).assertEqual('unhandled')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1530
     * @tc.name testSuper181
     * @tc.desc Verify operationsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new mis.CountedComposite181()
      root.add(new mis.Component181())
      root.add(new mis.Component181())
      expect(root.operation()).assertEqual('[leaf,leaf](n=2)')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1540
     * @tc.name testSuper182
     * @tc.desc Verify savesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o = new mis.TrackedOriginator182('A')
      let m = o.save()
      o.state = 'B'
      o.restore(m)
      expect(o.state).assertEqual('A')
      expect(o.history[0]).assertEqual('A')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1550
     * @tc.name testSuper183
     * @tc.desc Verify operationsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fw = new mis.TaggedFlyweight183('x')
      expect(fw.operation(5)).assertEqual('tag-x:5')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1560
     * @tc.name testSuper184
     * @tc.desc Verify clonesuperdescribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new mis.ConcretePrototype184(42)
      let copy = original.clone()
      expect(copy.id).assertEqual(42)
      expect(copy.describe()).assertEqual('proto#42')
      expect(copy === original).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1570
     * @tc.name testSuper185
     * @tc.desc Verify powersuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.SafeCalculator185().power(2, 3)).assertEqual(8)
      try {
        new mis.SafeCalculator185().power(0, -1)
        expect().assertFail()
      } catch (error) {
        let e = error as Error
        expect(e.message).assertEqual('division by zero')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1580
     * @tc.name testSuper186
     * @tc.desc Verify logsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.SafeCalculator186().log(Math.E)).assertEqual(1)
      try {
        new mis.SafeCalculator186().log(-1)
        expect().assertFail()
      } catch (error) {
        let e = error as Error
        expect(e.message).assertEqual('log of non-positive')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1590
     * @tc.name testSuper187
     * @tc.desc Verify tansuper.sin/super.cos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.TrigExt187().tan(0)).assertEqual(0)
      try {
        new mis.TrigExt187().tan(Math.PI / 2)
        expect().assertFail()
      } catch (error) {
        let e = error as Error
        expect(e.message).assertEqual('tan undefined')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1600
     * @tc.name testSuper188
     * @tc.desc Verify mean/variancesuper.sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new mis.ExtendedStats188()
      expect(s.mean([1, 2, 3])).assertEqual(2)
      expect(s.variance([5, 5, 5])).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1610
     * @tc.name testSuper189
     * @tc.desc Verify set/hassuper/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const READ = 1
      const WRITE = 2
      let f = new mis.TrackedFlags189()
      f.set(READ)
      f.set(WRITE)
      expect(f.has(READ)).assertTrue()
      expect(f.has(WRITE)).assertTrue()
      expect(f.changes).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1620
     * @tc.name testSuper190
     * @tc.desc Verify togglesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bf = new mis.CountedBitField190()
      bf.toggle(1)
      bf.toggle(2)
      bf.toggle(1)
      expect(bf.isSet(1)).assertFalse()
      expect(bf.isSet(2)).assertTrue()
      expect(bf.toggles).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1630
     * @tc.name testSuper191
     * @tc.desc Verify and/orsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = new mis.CountedEvaluator191()
      expect(e.and(false, () => {
        return true
      })).assertFalse()
      expect(e.or(true, () => {
        return false
      })).assertTrue()
      expect(e.calls).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1640
     * @tc.name testSuper192
     * @tc.desc Verify nor/nandsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new mis.DeMorgan192()
      expect(d.verify(true, false)).assertTrue()
      expect(d.verify(false, false)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1650
     * @tc.name testSuper194
     * @tc.desc Verify getHourssuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.OffsetClock194(10, 5)
      expect(c.getHours()).assertEqual(15)
      let c2 = new mis.OffsetClock194(22, 5)
      expect(c2.getHours()).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1660
     * @tc.name testSuper195
     * @tc.desc Verify inSecondssuper/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new mis.DetailedDuration195(3661000)
      expect(d.inSeconds()).assertEqual(3661)
      expect(d.inMinutes()).assertEqual(61)
      expect(d.inHours()).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1670
     * @tc.name testSuper196
     * @tc.desc Verify toCamelsuperPascal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new mis.EnhancedStringUtils196()
      expect(s.toCamel('hello_world')).assertEqual('helloWorld')
      expect(s.toPascal('hello_world')).assertEqual('HelloWorld')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1680
     * @tc.name testSuper197
     * @tc.desc Verify rendersuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new mis.SafeTemplate197()
      t.setVar('name', 'Alice')
      expect(t.render('Hello, ${name}!')).assertEqual('Hello, Alice!')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1690
     * @tc.name testSuper198
     * @tc.desc Verify encodesuperHTML
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = new mis.StrictEncoder198()
      expect(e.encode('<div>"hi"')).assertEqual('&lt;div&gt;&quot;hi&quot;')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1700
     * @tc.name testSuper199
     * @tc.desc Verify readsuper.parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.SafeJsonReader199()
      expect(r.read('{"a":{"b":1}}') !== null).assertTrue()
      expect(r.readPath('{"a":{"b":1}}', ['a', 'b'])).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1710
     * @tc.name testSuper200
     * @tc.desc Verify stringifysuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f = new mis.PrettyJsonFormatter200()
      let out = f.stringify({ a: 1 })
      expect(out.startsWith('{')).assertTrue()
      expect(out.includes('a')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1720
     * @tc.name testSuper201
     * @tc.desc Verify acquire/releasesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pool = new mis.CountedPool201()
      pool.release({ id: 1 })
      let item = pool.acquire()
      expect(item !== undefined).assertTrue()
      expect(pool.acquired).assertEqual(1)
      expect(pool.released).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1730
     * @tc.name testSuper202
     * @tc.desc Verify acquiresuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pool = new mis.BoundedPool202(1)
      pool.release({ id: 1 })
      let a = pool.acquire()
      let b = pool.acquire()
      expect(a === undefined).assertFalse()
      expect(b === undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1740
     * @tc.name testSuper203
     * @tc.desc Verify fetchsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new mis.CachedService203()
      expect(s.fetch(1)).assertEqual('item-1')
      expect(s.fetch(1)).assertEqual('item-1')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1750
     * @tc.name testSuper204
     * @tc.desc Verify operationsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p = new mis.ProxyTarget204()
      expect(p.operation(5)).assertEqual(10)
      expect(p.log[0]).assertEqual('before:5')
      expect(p.log[1]).assertEqual('after:10')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1760
     * @tc.name testSuper205
     * @tc.desc Verify processsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.PreInterceptor205().process('data')).assertEqual('[data]')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1770
     * @tc.name testSuper206
     * @tc.desc Verify processsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.PostInterceptor206().process('data')).assertEqual('data|done')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1780
     * @tc.name testSuper207
     * @tc.desc Verify handlesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.BubblingHandler207().handle('click')
      expect(r[0]).assertEqual('click')
      expect(r[1]).assertEqual('bubble:click')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1790
     * @tc.name testSuper208
     * @tc.desc Verify handlesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.CapturingHandler208().handle('click')
      expect(r[0]).assertEqual('capture:click')
      expect(r[1]).assertEqual('click')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1800
     * @tc.name testSuper209
     * @tc.desc Verify handlesuperstopPropagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h = new mis.StoppableHandler209()
      h.handle('click')
      expect(h.isStopped()).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1810
     * @tc.name testSuper210
     * @tc.desc Verify enqueuesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q = new mis.LoggingPriorityQueue210()
      q.enqueue({ value: 'low', priority: 1 })
      q.enqueue({ value: 'high', priority: 10 })
      expect(q.dequeue()!.value).assertEqual('high')
      expect(q.dequeue()!.value).assertEqual('low')
      expect(q.ops).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1820
     * @tc.name testSuper211
     * @tc.desc Verify dispatchsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.RoundingDispatcher211().dispatch([{ name: 'a', weight: 1 }, { name: 'b', weight: 3 }], 100)
      expect(r['a']).assertEqual(25)
      expect(r['b']).assertEqual(75)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1830
     * @tc.name testSuper212
     * @tc.desc Verify incrementsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new mis.AuditedCounter212()
      expect(c.increment()).assertEqual(1)
      expect(c.increment()).assertEqual(2)
      expect(c.ops).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1840
     * @tc.name testSuper213
     * @tc.desc Verify acquiresuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new mis.TrackedMutex213()
      expect(m.acquire('A')).assertTrue()
      expect(m.acquire('B')).assertFalse()
      m.release('A')
      expect(m.acquire('B')).assertTrue()
      expect(m.acquires).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1850
     * @tc.name testSuper214
     * @tc.desc Verify write/readsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new mis.VersionedStore214()
      s.write('a', 1)
      s.write('b', 2)
      expect(s.read('a')).assertEqual(1)
      expect(s.getVersion()).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1860
     * @tc.name testSuper215
     * @tc.desc Verify addsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q = new mis.LoggedTaskQueue215()
      q.add(() => {
      })
      q.add(() => {
      })
      expect(q.run()).assertEqual(2)
      expect(q.added).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1870
     * @tc.name testSuper216
     * @tc.desc Verify startsupersetInterval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new mis.CountedScheduler216()
      s.start(() => {
      }, 1000)
      s.stop()
      expect(s.starts).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1880
     * @tc.name testSuper217
     * @tc.desc Verify addsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new mis.SizedBatcher217(2)
      b.add(1)
      expect(b.flushIfFull().length).assertEqual(0)
      b.add(2)
      expect(b.flushIfFull().length).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1890
     * @tc.name testSuper218
     * @tc.desc Verify addsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p = new mis.InspectablePipe218()
      p.add(x => x + 1).add(x => x * 2)
      expect(p.run(3)).assertEqual(8)
      expect(p.stageCount()).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1900
     * @tc.name testSuper219
     * @tc.desc Verify filtersuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new mis.CountingStream219().filter(x => x > 2)
      let r = s.collect([1, 2, 3, 4])
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1910
     * @tc.name testSuper220
     * @tc.desc Verify mapsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new mis.TrackedMapper220().map(x => x * 10)
      let r = m.apply([1, 2, 3])
      expect(r[0]).assertEqual(10)
      expect(r[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1920
     * @tc.name testSuper222
     * @tc.desc Verify APIversionsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new mis.FallbackApi222(1).version()).assertEqual(1)
      expect(new mis.FallbackApi222(3).version()).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1930
     * @tc.name testSuper223
     * @tc.desc Verify tsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = new mis.ZhI18n223()
      expect(i.t('hello')).assertEqual('你好')
      expect(i.t('missing')).assertEqual('missing')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1940
     * @tc.name testSuper224
     * @tc.desc Verify validatesuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new mis.EmailValidator224()
      expect(v.validate('').includes('required')).assertTrue()
      expect(v.validate('abc').includes('invalid email')).assertTrue()
      expect(v.validate('a@b').length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1950
     * @tc.name testSuper225
     * @tc.desc Verify mapsuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new mis.ExtendedMapper225()
      let r = m.map({ id: 1, name: 'Alice', extra: 'vip' })
      expect(r['id']).assertEqual(1)
      expect(r['name']).assertEqual('Alice')
      expect(r['extra']).assertEqual('vip')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1960
     * @tc.name testSuper226
     * @tc.desc Verify JSONtransformsuperJSON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new mis.JsonTransformer226()
      let r = JSON.parse(t.transform(42)) as Record<string, Object>
      expect(r['value']).assertEqual('num:42')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SUPER_1970
     * @tc.name testSuper227
     * @tc.desc Verify reducesuper.sum+
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSuper227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new mis.ProductReducer227()
      expect(r.reduce([1, 2, 3])).assertEqual(6)
      expect(r.sumAndProduct([1, 2, 3])).assertEqual(12)
    });

  });
}