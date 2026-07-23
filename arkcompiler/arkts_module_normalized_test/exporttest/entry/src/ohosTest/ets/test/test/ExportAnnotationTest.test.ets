/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { AnnoTest0200Class, AnnoTest0300Class, AnnoTest0400Class, AnnoTest0500Class, AnnoTest0600Class, AnnoTest0700Class, AnnoTest0900Class } from '../exports_annotation/AnnoTestClasses';
import { sleep } from "../utils/Utils";

export default function exportAnnotationTest() {
  describe('ExportAnnotationTest', () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   exportAnnotationTest0200
     * @tc.number SUB_EXPORT_ANNOTATION_TEST_0200
     * @tc.desc   Test @AnnoStringDefault annotated class export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportAnnotationTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let obj: AnnoTest0200Class = new AnnoTest0200Class();
      expect(obj.tag).assertEqual('AnnoTest0200Class');
      expect(obj.getTag()).assertEqual('AnnoTest0200Class');
    })

    /**
     * @tc.name   exportAnnotationTest0300
     * @tc.number SUB_EXPORT_ANNOTATION_TEST_0300
     * @tc.desc   Test @AnnoNumberDefault annotated class export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportAnnotationTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let obj: AnnoTest0300Class = new AnnoTest0300Class();
      expect(obj.tag).assertEqual('AnnoTest0300Class');
      expect(obj.getTag()).assertEqual('AnnoTest0300Class');
    })

    /**
     * @tc.name   exportAnnotationTest0400
     * @tc.number SUB_EXPORT_ANNOTATION_TEST_0400
     * @tc.desc   Test @AnnoBooleanDefault annotated class export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportAnnotationTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let obj: AnnoTest0400Class = new AnnoTest0400Class();
      expect(obj.tag).assertEqual('AnnoTest0400Class');
      expect(obj.getTag()).assertEqual('AnnoTest0400Class');
    })

    /**
     * @tc.name   exportAnnotationTest0500
     * @tc.number SUB_EXPORT_ANNOTATION_TEST_0500
     * @tc.desc   Test @AnnoEnumArrayDefault annotated class export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportAnnotationTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let obj: AnnoTest0500Class = new AnnoTest0500Class();
      expect(obj.tag).assertEqual('AnnoTest0500Class');
      expect(obj.getTag()).assertEqual('AnnoTest0500Class');
    })

    /**
     * @tc.name   exportAnnotationTest0600
     * @tc.number SUB_EXPORT_ANNOTATION_TEST_0600
     * @tc.desc   Test @AnnoNoDefault with explicit value annotated class export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportAnnotationTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let obj: AnnoTest0600Class = new AnnoTest0600Class();
      expect(obj.tag).assertEqual('AnnoTest0600Class');
      expect(obj.getTag()).assertEqual('AnnoTest0600Class');
    })

    /**
     * @tc.name   exportAnnotationTest0700
     * @tc.number SUB_EXPORT_ANNOTATION_TEST_0700
     * @tc.desc   Test @AnnoMultiField with defaults annotated class export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportAnnotationTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let obj: AnnoTest0700Class = new AnnoTest0700Class();
      expect(obj.tag).assertEqual('AnnoTest0700Class');
      expect(obj.getTag()).assertEqual('AnnoTest0700Class');
    })

    /**
     * @tc.name   exportAnnotationTest0900
     * @tc.number SUB_EXPORT_ANNOTATION_TEST_0900
     * @tc.desc   Test @AnnoMultiField with explicit values annotated class export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportAnnotationTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let obj: AnnoTest0900Class = new AnnoTest0900Class();
      expect(obj.tag).assertEqual('AnnoTest0900Class');
      expect(obj.getTag()).assertEqual('AnnoTest0900Class');
    })
  })
}
