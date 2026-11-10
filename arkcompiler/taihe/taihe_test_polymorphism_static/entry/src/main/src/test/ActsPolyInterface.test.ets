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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import {BusinessError} from '@ohos.base';
import * as poly from '../ets/poly';

export default function polyInterfaceTest(): void {
  describe("ActsPolyInterfaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Poly_InterfaceAnimal_STATIC_0100
     * @tc.name      test_interact_animal
     * @tc.desc      Test interactAnimal with AnimalType variants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_interact_animal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_interact_animal start');
      let unknownObj = poly.getAnimal(poly.AnimalTag.ANIMAL);
      let dogObj = poly.getAnimal(poly.AnimalTag.DOG);
      let catObj = poly.getAnimal(poly.AnimalTag.CAT);
      expect(poly.interactAnimal(unknownObj)).assertEqual("Unknown Animal");
      expect(poly.interactAnimal(dogObj)).assertEqual("Dog");
      expect(poly.interactAnimal(catObj)).assertEqual("Cat");
      console.log('test_interact_animal done');
      done();
      console.log('test_interact_animal end');

    });

    /**
     * @tc.number    SUB_Taihe_Poly_InterfaceMakeAnimal_STATIC_0200
     * @tc.name      test_make_animal
     * @tc.desc      Test makeAnimal returns a valid Animal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_animal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_animal start');
      let animal = poly.makeAnimal();
      expect(animal).not().assertNull();
      animal.speak();
      animal.move();
      console.log('test_make_animal done');
      done();
      console.log('test_make_animal end');

    });

    /**
     * @tc.number    SUB_Taihe_Poly_InterfaceMakeDog_STATIC_0300
     * @tc.name      test_make_dog
     * @tc.desc      Test makeDog returns a valid Dog with all methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_dog", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_dog start');
      let dog = poly.makeDog();
      expect(dog).not().assertNull();
      dog.speak();
      dog.move();
      dog.fetch();
      console.log('test_make_dog done');
      done();
      console.log('test_make_dog end');

    });

    /**
     * @tc.number    SUB_Taihe_Poly_InterfaceMakeCat_STATIC_0400
     * @tc.name      test_make_cat
     * @tc.desc      Test makeCat returns a valid Cat with all methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_make_cat", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_make_cat start');
      let cat = poly.makeCat();
      expect(cat).not().assertNull();
      cat.speak();
      cat.move();
      cat.fetch();
      console.log('test_make_cat done');
      done();
      console.log('test_make_cat end');

    });
  });
}