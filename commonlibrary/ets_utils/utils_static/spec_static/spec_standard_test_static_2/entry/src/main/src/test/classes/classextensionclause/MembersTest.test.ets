'use static';
/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Animal {
  name: string = '';
  constructor(name: string) {
    this.name = name;
  }
  public speak(): string {
    return "Animal speak";
  }
}

class Dog extends Animal {
  breed: string = '';
  constructor(name: string, breed: string) {
    super(name);
    this.breed = breed;
  }
  public speak(): string {
    return "Dog speak";
  }
}

class Fish extends Animal {
  protected waterType: string;
  constructor(name: string, waterType: string) {
    super(name);
    this.waterType = waterType;
  }
  public speak(): string {
    return "Fish speak";
  }

  public getWaterType(): string {
    return this.waterType;
  }
}

class Fish2 extends Animal {
  private waterType: string;
  constructor(name: string, waterType: string) {
    super(name);
    this.waterType = waterType;
  }
  public speak(): string {
    return "Fish speak";
  }

  public getWaterType(): string {
    return this.waterType;
  }
}

class Mammal extends Animal {
  public furColor: string;
  constructor(name: string, furColor: string) {
    super(name);
    this.furColor = furColor;
  }
  public speak(): string {
    return "Mammal sound";
  }
}

class Lion extends Mammal {
  constructor(name: string) {
    super(name, "Golden");
  }
  public speak(): string {
    return "Roar!";
  }
}

interface Motion {
  swim(): string;
}

class Dolphin extends Animal implements Motion {
  public swim(): string {
    return "Dolphin is swimming";
  }
  public speak(): string {
    return "Click!";
  }
  constructor(name: string) {
    super(name);
  }
}

abstract class Bird2 extends Animal {
  public abstract fly(): string;
  constructor(name: string) {
    super(name);
  }
}

class Eagle extends Bird2 {
  public fly(): string {
    return "Eagle is flying";
  }
  public speak(): string {
    return "Screech!";
  }
  constructor(name: string) {
    super(name);
  }
}

class Wolf extends Animal {
  public packSize: number;
  constructor(name: string, packSize: number) {
    super(name);
    this.packSize = packSize;
  }
  public speak(): string {
    return "Howl!";
  }
}

class Animal10 {
  private _age: number;
  constructor(age: number) {
    this._age = age;
  }
  get age(): number {
    return this._age;
  }
  set age(value: number) {
    this._age = value;
  }
}

class Dog4 extends Animal10 {
  constructor(age: number) {
    super(age);
  }

  get age(): number {
    return super.age * 7;
  }
}




export default function MembersTest():void {
  describe('MembersTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_0100
     * @tc.name      testMembers0001
     * @tc.desc      Testing access to member variables in the case of polymorphism. Access member variables of
     * the base class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animal = new Animal("Generic");
      expect(animal.name).assertEqual("Generic");
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_0200
     * @tc.name      testMembers0002
     * @tc.desc      Testing access to member variables in the case of polymorphism. Polymorphism - accessing subclass
     * methods through base class references
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new Dog("Buddy", "Golden Retriever");
      expect(dog.name).assertEqual("Buddy");
      expect(dog.breed).assertEqual("Golden Retriever");
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_0300
     * @tc.name      testMembers0003
     * @tc.desc      Testing access to member variables in the case of polymorphism. Access member variables of
     * the base class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animal: Animal = new Dog("Max", "Labrador");
      expect(animal.speak()).assertEqual("Dog speak");
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_0400
     * @tc.name      testMembers0004
     * @tc.desc      Testing access to member variables in the case of polymorphism. Polymorphism - accessing member
     * variables of a subclass through a base class reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animal: Animal = new Dog("Max", "Labrador");
      expect((animal as Dog).breed).assertEqual("Labrador");
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_0500
     * @tc.name      testMembers0005
     * @tc.desc      Testing access to member variables in the case of polymorphism. Protected member
     * variable - polymorphism
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animal: Animal = new Fish("Dory", "Saltwater")
      expect((animal as Fish).getWaterType()).assertEqual("Saltwater");
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_0600
     * @tc.name      testMembers0006
     * @tc.desc      Testing access to member variables in the case of polymorphism. Private member
     * variable - polymorphism
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animal: Animal = new Fish2("Dory", "Saltwater");
      expect((animal as Fish2).getWaterType()).assertEqual("Saltwater");
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_0700
     * @tc.name      testMembers0007
     * @tc.desc      Testing access to member variables in the case of polymorphism. Multiple inheritance
     * hierarchies - polymorphism
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animal: Animal = new Lion("Mufasa");
      expect(animal.speak()).assertEqual("Roar!");
      expect((animal as Lion).furColor).assertEqual("Golden");
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_0800
     * @tc.name      testMembers0008
     * @tc.desc      Testing access to member variables in the case of polymorphism. Test member variable access when
     * combining interfaces and polymorphism
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animal: Animal = new Dolphin("Dolly");
      expect((animal as Dolphin).swim()).assertEqual("Dolphin is swimming");
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_0900
     * @tc.name      testMembers0009
     * @tc.desc      Testing access to member variables in the case of polymorphism. Member variable access when
     * testing abstract classes combined with polymorphism
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animal: Animal = new Eagle("Sky");
      expect("Eagle is flying").assertEqual((animal as Eagle).fly());
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_1000
     * @tc.name      testMembers0010
     * @tc.desc      Testing access to member variables in the case of polymorphism. Testing polymorphism and access
     * to member variables when rewriting methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const animal: Animal = new Wolf("Luna", 3);
      expect((animal as Wolf).packSize).assertEqual(3);
      expect((animal as Wolf).name).assertEqual("Luna");
    });

    /**
     * @tc.number    SUB_MEMBERS_ONE_TEST_1100
     * @tc.name      testMembers0011
     * @tc.desc      Testing access to member variables in the case of polymorphism. Under testing polymorphism,
     * subclasses override parent class's property accessors
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMembers0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new Dog4(5);
      expect(dog.age).assertEqual(35);
      const animal: Animal10 = new Dog4(5);
      expect((animal as Dog4).age).assertEqual( 35);
    });
  })
}
