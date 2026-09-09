'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {BusinessError} from '@ohos.base';
import * as StructTest from '../ets/struct_test';

export default function actsStructFactoryTest() {
  describe('ActsStructFactory', () => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_StructFactory_ADDNEWCANVAS_STATIC_0100
     * @tc.name      test_struct_addNewCanvas
     * @tc.desc      Create Canvas with addNewCanvas, verify Color fields and name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_addNewCanvas', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_addNewCanvas start');
      let canvas1 = StructTest.addNewCanvas('RedCanvas');
      expect(canvas1.name).assertEqual('RedCanvas');
      expect(canvas1.r).assertEqual(255);
      expect(canvas1.g).assertEqual(0);
      expect(canvas1.b).assertEqual(255);
      console.log('test_struct_addNewCanvas done');
      done();
      console.log('test_struct_addNewCanvas end');
    })

    /**
     * @tc.number    SUB_Taihe_StructFactory_ADDNEWDRAW_STATIC_0100
     * @tc.name      test_struct_addNewDraw
     * @tc.desc      Create Draw with AddNewDraw, verify Color fields and name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_addNewDraw', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_addNewDraw start');
      let draw = StructTest.addNewDraw('addNewDraw');
      expect(draw.name).assertEqual('addNewDraw');
      expect(draw.r).assertEqual(255);
      expect(draw.g).assertEqual(0);
      expect(draw.b).assertEqual(255);
      console.log('test_struct_addNewDraw done');
      done();
      console.log('test_struct_addNewDraw end');
    })

    /**
     * @tc.number    SUB_Taihe_StructFactory_CREATESTUDENT_STATIC_0100
     * @tc.name      test_struct_create_student
     * @tc.desc      Create Student with create_student, verify default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_create_student', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_create_student start');
      let student = StructTest.create_student();
      expect(student.name).assertEqual('Mary');
      expect(student.age).assertEqual(15);
      console.log('test_struct_create_student done');
      done();
      console.log('test_struct_create_student end');
    })

    /**
     * @tc.number    SUB_Taihe_StructFactory_PROCESSSTUDENT_STATIC_0100
     * @tc.name      test_struct_process_student
     * @tc.desc      Process Student with process_student, verify transformed values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_process_student', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_process_student start');
      let student: StructTest.Student = {name: 'Jack', age: 10};
      let pro_student = StructTest.process_student(student);
      expect(pro_student.name).assertEqual('Jack student');
      expect(pro_student.age).assertEqual(20);
      console.log('test_struct_process_student done');
      done();
      console.log('test_struct_process_student end');
    })

    /**
     * @tc.number    SUB_Taihe_StructFactory_CREATETEACHER_STATIC_0100
     * @tc.name      test_struct_create_teacher
     * @tc.desc      Create Teacher with create_teacher, verify default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_create_teacher', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_create_teacher start');
      let teacher = StructTest.create_teacher();
      expect(teacher.name).assertEqual('Rose');
      expect(teacher.age).assertEqual(25);
      console.log('test_struct_create_teacher done');
      done();
      console.log('test_struct_create_teacher end');
    })

    /**
     * @tc.number    SUB_Taihe_StructFactory_PROCESSTEACHER_STATIC_0100
     * @tc.name      test_struct_process_teacher
     * @tc.desc      Process Teacher with process_teacher, verify transformed values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_process_teacher', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_process_teacher start');
      let teacher: StructTest.Teacher = new StructTest.Teacher('Jony', 30);
      let pro_teacher = StructTest.process_teacher(teacher);
      expect(pro_teacher.name).assertEqual('Jony teacher');
      expect(pro_teacher.age).assertEqual(45);
      console.log('test_struct_process_teacher done');
      done();
      console.log('test_struct_process_teacher end');
    })

    /**
     * @tc.number    SUB_Taihe_StructFactory_PROCESSG_STATIC_0100
     * @tc.name      test_struct_process_g
     * @tc.desc      Process G with process_g, verify transformed values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_process_g', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_process_g start');
      let g: StructTest.G = {f: 0, g: 0};
      let new_g = StructTest.process_g(g);
      expect(new_g.f).assertEqual(1);
      expect(new_g.g).assertEqual(2);
      console.log('test_struct_process_g done');
      done();
      console.log('test_struct_process_g end');
    })

    /**
     * @tc.number    SUB_Taihe_StructFactory_PROCESSH_STATIC_0100
     * @tc.name      test_struct_process_h
     * @tc.desc      Process H with process_h, verify transformed values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_process_h', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_process_h start');
      let h = new StructTest.H(0, 0, 0);
      let new_h = StructTest.process_h(h);
      expect(new_h.f).assertEqual(1);
      expect(new_h.g).assertEqual(2);
      expect(new_h.h).assertEqual(3);
      console.log('test_struct_process_h done');
      done();
      console.log('test_struct_process_h end');
    })
  })
}