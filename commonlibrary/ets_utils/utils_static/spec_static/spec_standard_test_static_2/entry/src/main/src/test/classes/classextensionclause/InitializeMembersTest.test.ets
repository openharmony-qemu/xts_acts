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
} from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Animal {
  public name: string;
  public age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class Dog extends Animal {
  public breed: string;

  constructor(name: string, age: number, breed: string) {
    super(name, age);
    this.breed = breed;
  }
}

class Animal1 {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

class Dog1 extends Animal1 {
  constructor(value: string) {
    super(value);
  }
}

class Parent {
  public constructorPublicVar: string;

  constructor(initialValue: string) {
    this.constructorPublicVar = initialValue;
  }
}

class Child extends Parent {
  constructor() {
    super('abc');
  }
}

class Parent1 {
  public constructorPublicVar: number[];

  constructor(initialValue: number[]) {
    this.constructorPublicVar = initialValue;
  }
}

class Child1 extends Parent1 {
  constructor(childValue: number[]) {
    super(childValue);
  }
}

class Parent2 {
  public constructorPublicVar: undefined;

  constructor(initialValue: undefined) {
    this.constructorPublicVar = initialValue;
  }
}

class Child2 extends Parent2 {
  constructor(childValue: undefined) {
    super(childValue);
  }
}

class Parent3 {
  public constructorPublicVar: boolean[];

  constructor(initialValue: boolean[]) {
    this.constructorPublicVar = initialValue;
  }
}

class Child3 extends Parent3 {
  constructor(childValue: boolean[]) {
    super(childValue);
  }
}

class Parent4 {
  public value: int;

  constructor(value: int) {
    this.value = value;
  }
}

class Child4 extends Parent4 {
  constructor(value: int) {
    super(value);
  }
}

class Parent5 {
  public value: number[];

  constructor(value: number[]) {
    this.value = value;
  }
}

class Child5 extends Parent5 {
  constructor(value: number[]) {
    super(value);
  }
}

class Parent6 {
  public value: string[];

  constructor(value: string[]) {
    this.value = value;
  }
}

class Child6 extends Parent6 {
  constructor(value: string[]) {
    super(value);
  }
}

class Parent7 {
  public value: undefined;

  constructor(value: undefined) {
    this.value = value;
  }
}

class Child7 extends Parent7 {
  constructor(value: undefined) {
    super(value);
  }
}

class Parent8 {
  public value: boolean[];

  constructor(value: boolean[]) {
    this.value = value;
  }
}

class Child8 extends Parent8 {
  constructor(value: boolean[]) {
    super(value);
  }
}

class Parent9 {
  public value: null;

  constructor(value: null) {
    this.value = value;
  }
}

class Child9 extends Parent9 {
  constructor(value: null) {
    super(value);
  }
}

class Parent10 {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

class Child10 extends Parent10 {
  constructor(value: number) {
    super(value);
  }
}

const date1 = new Date(2023, 10, 1);
const date2 = new Date(2023, 10, 2);

class Parent11 {
  public value: Date[];

  constructor(value: Date[]) {
    this.value = value;
  }
}

class Child11 extends Parent11 {
  constructor(value: Date[]) {
    super(value);
  }
}

class User {
  public name: string = "User";
}

class Parent12 {
  public value: User[];

  constructor(value: User[]) {
    this.value = value;
  }
}

class Child12 extends Parent12 {
  constructor(value: User[]) {
    super(value);
  }
}

interface SomeInterface {
  name: string;
}

const obj1: SomeInterface = { name: "Object1" };
const obj2: SomeInterface = { name: "Object2" };

class Parent13 {
  public value: SomeInterface[];

  constructor(value: SomeInterface[]) {
    this.value = value;
  }
}

class Child13 extends Parent13 {
  constructor(value: SomeInterface[]) {
    super(value);
  }
}

class Parent14 {
  public value: boolean;

  constructor(value: boolean) {
    this.value = value;
  }
}

class Child14 extends Parent14 {
  constructor(value: boolean) {
    super(value);
  }
}

const date = new Date(2023, 10, 1);

class Parent15 {
  public value: Date;

  constructor(value: Date) {
    this.value = value;
  }
}

class Child15 extends Parent15 {
  constructor(value: Date) {
    super(value);
  }
}

class UserClass {
  public name: string = "User";
}

class Parent16 {
  public value: UserClass;

  constructor(value: UserClass) {
    this.value = value;
  }
}

class Child16 extends Parent16 {
  constructor(value: UserClass) {
    super(value);
  }
}

class Parent17 {
  public constructorPublicVar: number;

  constructor() {
    this.constructorPublicVar = 100;
  }
}

class Child17 extends Parent17 {
  constructor() {
    super();
  }
}

class Parent18 {
  public constructorPublicVar: number = 100;
}

class Child18 extends Parent18 {
}

class Parent19 {
  public constructorPublicVar: number;

  constructor() {
    this.constructorPublicVar = 100;
  }
}

class Child19 extends Parent19 {
}

class Parent20 {
  protected constructorPublicVar: number = 100;
}

class Child20 extends Parent20 {
  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent21 {
  protected constructorPublicVar: number;

  constructor() {
    this.constructorPublicVar = 100;
  }
}

class Child21 extends Parent21 {
  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent22 {
  private constructorPublicVar: number = 100;

  protected getprivateVar(): number {
    return this.constructorPublicVar;
  }
}

class Child22 extends Parent22 {
  public showPrivateVar(): number {
    return this.getprivateVar();
  }
}

class Parent23 {
  private constructorPublicVar: number;

  constructor() {
    this.constructorPublicVar = 100;
  }

  protected getprivateVar(): number {
    return this.constructorPublicVar;
  }
}

class Child23 extends Parent23 {
  public showPrivateVar(): number {
    return this.getprivateVar();
  }
}

class Parent24 {
  constructorPublicVar: number = 100;
}

class Child24 extends Parent24 {
}

class Parent25 {
  constructorPublicVar: number;

  constructor() {
    this.constructorPublicVar = 100;
  }
}

class Child25 extends Parent25 {
}

class Parent26 {
  public constructorPublicVar: number = 200;

  constructor() {
    this.constructorPublicVar = 100;
  }
}

class Child26 extends Parent26 {
}

class Parent27 {
  public constructorPublicVar: number;
}

class Child27 extends Parent27 {
  public constructorPublicVar: number = 100;
}

class Parent28 {
  public constructorPublicVar: number = 200;
}

class Child28 extends Parent28 {
  public constructorPublicVar: number = 100;
}

class Parent29 {
  public constructorPublicVar: number;
}

class Child29 extends Parent29 {
  constructor() {
    super();
    this.constructorPublicVar = 100;
  }
}

class Parent30 {
  public constructorPublicVar: number;
}

class Child30 extends Parent30 {
  public childField1 : number = 200;
}

class Parent31 {
  public constructorPublicVar: number;
}

class Child31 extends Parent31 {
  public childField1 : number;

  constructor() {
    this.childField1 = 200;
  }
}

class Parent32 {
  public constructorPublicVar: number;
}

class Child32 extends Parent32 {
  public constructorPublicVar: number = 100;

  constructor() {
    this.constructorPublicVar = 200;
  }
}

class Parent33 {
  public constructorPublicVar: number = 400;
}

class Child33 extends Parent33 {
  constructor() {
    this.constructorPublicVar = 200;
  }
}

class Parent34 {
  public constructorPublicVar: number;

  constructor() {
    this.constructorPublicVar = 400;
  }
}

class Child34 extends Parent34 {
  constructor() {
    this.constructorPublicVar = 200;
  }
}

class Parent35 {
  public constructorPublicVar: number = 500;

  constructor() {
    this.constructorPublicVar = 400;
  }
}

class Child35 extends Parent35 {
  constructor() {
    this.constructorPublicVar = 200;
  }
}

class Parent36 {
  public constructorPublicVar: number = 500;

  constructor() {
    this.constructorPublicVar = 400;
  }
}

class Child36 extends Parent36 {
  public constructorPublicVar: number = 600;
  constructor() {
    this.constructorPublicVar = 200;
  }
}

class Parent37 {
  public constructorPublicVar: number;

  constructor(value: number) {
    this.constructorPublicVar = value;
  }
}

class Child37 extends Parent37 {
  constructor() {
    super(100);
  }
}

class Parent38 {
  protected constructorPublicVar: number;
}

class Child38 extends Parent38 {
  protected constructorPublicVar: number = 100;

  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent39 {
  protected constructorPublicVar: number = 200;
}

class Child39 extends Parent39 {
  protected constructorPublicVar: number = 100;

  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent40 {
  protected constructorPublicVar: number;
}

class Child40 extends Parent40 {
  constructor() {
    super();
    this.constructorPublicVar = 100;
  }

  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent41 {
  protected constructorPublicVar: number;
}

class Child41 extends Parent41 {
  protected childField1 : number = 200;

  public getProtectedValueFromChild(): number {
    return this.childField1;
  }
}

class Parent42 {
  protected constructorPublicVar: number;
}

class Child42 extends Parent42 {
  public childField1 : number

  constructor() {
    this.childField1 = 200;
  }

  public getProtectedValueFromChild(): number {
    return this.childField1;
  }
}

class Parent43 {
  protected constructorPublicVar: number;
}

class Child43 extends Parent43 {
  protected constructorPublicVar: number = 100;

  constructor() {
    this.constructorPublicVar = 200;
  }

  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent44 {
  public constructorPublicVar: number;

  constructor() {
    this.constructorPublicVar = 400;
  }
}

class Child44 extends Parent44 {
  constructor() {
    this.constructorPublicVar = 200;
  }

  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent45 {
  protected constructorPublicVar: number;

  constructor() {
    this.constructorPublicVar = 400;
  }
}

class Child45 extends Parent45 {
  protected constructorPublicVar: number = 500;

  constructor() {
    this.constructorPublicVar = 200;
  }

  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent46 {
  protected constructorPublicVar: number = 600;

  constructor() {
    this.constructorPublicVar = 400;
  }
}

class Child46 extends Parent46 {
  protected constructorPublicVar: number = 500;

  constructor() {
    this.constructorPublicVar = 200;
  }

  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent47 {
  protected constructorPublicVar: number;

  constructor(value: number) {
    this.constructorPublicVar = value;
  }
}

class Child47 extends Parent47 {
  constructor() {
    super(100);
  }

  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent48 {
  private constructorPublicVar: number = 100;
}

class Child48 extends Parent48 {
  private childField1: number = 100;

  public showPrivateVar(): number {
    return this.childField1;
  }
}

class Parent49 {
  private constructorPublicVar: number = 200;
}

class Child49 extends Parent49 {
  private constructorPublicVar: number = 100;

  public getProtectedValueFromChild(): number {
    return this.constructorPublicVar;
  }
}

class Parent50 {
  private constructorPublicVar: number;
}

class Child50 extends Parent50 {
  private childField1 : number;

  constructor() {
    this.childField1 = 100;
  }

  public getProtectedValueFromChild(): number {
    return this.childField1;
  }
}

class Parent51 {
  private constructorPublicVar: number;
}

class Child51 extends Parent51 {
  private childField1 : number = 200;

  constructor() {
    this.childField1 = 100;
  }

  public getProtectedValueFromChild(): number {
    return this.childField1;
  }
}

class Parent52 {
  private constructorPublicVar: number;

  constructor(value: number) {
    this.constructorPublicVar = value;
  }

  protected getConstructorPublicVar(): number {
    return this.constructorPublicVar;
  }
}

class Child52 extends Parent52 {
  constructor() {
    super(100);
  }

  public getProtectedValueFromChild(): number {
    return this.getConstructorPublicVar();
  }
}

class Parent53 {
  constructorPublicVar: number;
}

class Child53 extends Parent53 {
  constructorPublicVar: number = 200;
}

export default function InitializeMembersTest():void {
  describe('InitializeMembersTest', () => {
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
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_0100
     * @tc.name      testInitializeMembers0001
     * @tc.desc      Create a subclass instance and initialize its member variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myDog = new Dog("Buddy", 5, "Golden Retriever");
      expect(myDog.name).assertEqual("Buddy");
      expect(myDog.age).assertEqual(5);
      expect(myDog.breed).assertEqual("Golden Retriever");
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_0200
     * @tc.name      testInitializeMembers0002
     * @tc.desc      To verify that the parent class member variables whose type is string are correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myAnimal = new Animal1('def');
      expect(myAnimal.value).assertEqual('def');
      const myDog = new Dog1('abc');
      expect(myDog.value).assertEqual('abc');
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_0300
     * @tc.name      testInitializeMembers0003
     * @tc.desc       The subclass initializes member variables in the constructor, with the modifier being public and
     * the type being string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child();
      let x: string = child.constructorPublicVar;
      expect(x).assertEqual('abc');
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_0400
     * @tc.name      testInitializeMembers0004
     * @tc.desc      The subclass initializes member variables in the constructor, with the modifier being public and
     * the type being number[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const y : number[] = [1, 2, 3];
      let child = new Child1(y);
      let x: number[] = child.constructorPublicVar;
      expect(x[0]).assertEqual(1);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_0500
     * @tc.name      testInitializeMembers0005
     * @tc.desc      The subclass initializes member variables in the constructor, with the modifier being public and
     * the type being undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child2(undefined);
      let x: undefined = child.constructorPublicVar;
      expect(x).assertEqual(undefined);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_0600
     * @tc.name      testInitializeMembers0006
     * @tc.desc      The subclass initializes member variables in the constructor, with the modifier being public and
     * the type being boolean[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const y : boolean[] = [true, false, true];
      let child = new Child3(y);
      let x: boolean[] = child.constructorPublicVar;
      expect(x[0]).assertEqual(true);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_0700
     * @tc.name      testInitializeMembers0007
     * @tc.desc      To verify that the parent class member variable (type int) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child4(1);
      expect(myChild.value).assertEqual(1);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_0800
     * @tc.name      testInitializeMembers0008
     * @tc.desc      To verify that the parent class member variable (type number[]) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child5([1, 2, 3]);
      expect(myChild.value[0]).assertEqual(1);
      expect(myChild.value[1]).assertEqual(2);
      expect(myChild.value[2]).assertEqual(3);
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_0900
     * @tc.name      testInitializeMembers0009
     * @tc.desc      To verify that the parent class member variable (type string[]) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child6(['a', 'b', 'c']);
      expect(myChild.value[0]).assertEqual('a');
      expect(myChild.value[1]).assertEqual('b');
      expect(myChild.value[2]).assertEqual('c');
    });


    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1000
     * @tc.name      testInitializeMembers0010
     * @tc.desc      To verify that the parent class member variable (type undefined) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child7(undefined);
      expect(myChild.value).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1100
     * @tc.name      testInitializeMembers0011
     * @tc.desc      To verify that the parent class member variable (type boolean[]) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child8([true, false, true]);
      expect(myChild.value[0]).assertEqual(true);
      expect(myChild.value[1]).assertEqual(false);
      expect(myChild.value[2]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1200
     * @tc.name      testInitializeMembers0012
     * @tc.desc      To verify that the parent class member variable (type null) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child9(null);
      expect(myChild.value).assertEqual(null);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1300
     * @tc.name      testInitializeMembers0013
     * @tc.desc      To verify that the parent class member variable (type number) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child10(3.14);
      expect(myChild.value).assertEqual(3.14);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1400
     * @tc.name      testInitializeMembers0014
     * @tc.desc      To verify that the parent class member variable (type Date) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child11([date1, date2]);
      expect(myChild.value[0]).assertEqual(date1);
      expect(myChild.value[1]).assertEqual(date2);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1500
     * @tc.name      testInitializeMembers0015
     * @tc.desc      To verify that the parent class member variable (type Custom class object array) is correctly
     * initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const users: User[] = [new User(), new User()];
      const myChild = new Child12(users);
      expect(myChild.value[0].name).assertEqual("User");
      expect(myChild.value[1].name).assertEqual("User");
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1600
     * @tc.name      testInitializeMembers0016
     * @tc.desc      To verify that the parent class member variable (type Interface object array) is correctly
     * initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const interface1: SomeInterface[] = [obj1, obj2];
      const myChild = new Child13(interface1);
      expect(myChild.value[0].name).assertEqual("Object1");
      expect(myChild.value[1].name).assertEqual("Object2");
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1700
     * @tc.name      testInitializeMembers0017
     * @tc.desc      To verify that the parent class member variable (type boolean) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child14(true);
      expect(myChild.value).assertEqual(true);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1800
     * @tc.name      testInitializeMembers0018
     * @tc.desc      To verify that the parent class member variable (type Date) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child15(date);
      expect(myChild.value).assertEqual(date);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_1900
     * @tc.name      testInitializeMembers0019
     * @tc.desc      To verify that the parent class member variable (type custom class object) is correctly initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myChild = new Child16(new UserClass());
      expect(myChild.value.name).assertEqual("User");
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2000
     * @tc.name      testInitializeMembers0020
     * @tc.desc      Subclass overwrites the initial value of the parent class member variable (type number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child17();
      let x : number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2100
     * @tc.name      testInitializeMembers0021
     * @tc.desc      The parent class directly initializes member variables, with the modifier being public and the
     * type being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child18();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2200
     * @tc.name      testInitializeMembers0022
     * @tc.desc      The parent class initializes member variables in the constructor, with the modifier being public
     * and the type being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child19();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2300
     * @tc.name      testInitializeMembers0023
     * @tc.desc      The parent class directly initializes member variables, with the modifier being protected and
     * the type being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child20();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2400
     * @tc.name      testInitializeMembers0024
     * @tc.desc      The parent class initializes member variables in the constructor, with the modifier being
     * protected and the type being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child21();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2500
     * @tc.name      testInitializeMembers0025
     * @tc.desc      The parent class directly initializes member variables, with the modifier being private and
     * the type being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child22();
      let x: number = child.showPrivateVar();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2600
     * @tc.name      testInitializeMembers0026
     * @tc.desc      The parent class initializes member variables in the constructor, with the modifier being private
     * and the type being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child23();
      let x: number = child.showPrivateVar();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2700
     * @tc.name      testInitializeMembers0027
     * @tc.desc      The parent class directly initializes member variables, with the modifier being internal and the
     * type being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child24();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2800
     * @tc.name      testInitializeMembers0028
     * @tc.desc      The parent class initializes member variables in the constructor, with the modifier being internal
     * and the type being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child25();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_2900
     * @tc.name      testInitializeMembers0029
     * @tc.desc      The parent class modifies the value of the directly initialized member variable in the constructor
     * function. The modifier is public and the type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child26();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3000
     * @tc.name      testInitializeMembers0030
     * @tc.desc      The subclass directly initializes member variables, with the modifier being public and the type
     * being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child27();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3100
     * @tc.name      testInitializeMembers0031
     * @tc.desc      The subclass hides the initial value of the field with the same name of the parent class.
     * The modifier is public and the type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child28();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3200
     * @tc.name      testInitializeMembers0032
     * @tc.desc      The subclass initializes member variables in the constructor, with the modifier public and type
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child29();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3300
     * @tc.name      testInitializeMembers0033
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child30();
      let x: number = child.childField1;
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3400
     * @tc.name      testInitializeMembers0034
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child31();
      let x: number = child.childField1;
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3500
     * @tc.name      testInitializeMembers0035
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child32();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3600
     * @tc.name      testInitializeMembers0036
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child33();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3700
     * @tc.name      testInitializeMembers0037
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child34();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3800
     * @tc.name      testInitializeMembers0038
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child35();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_3900
     * @tc.name      testInitializeMembers0039
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child36();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4000
     * @tc.name      testInitializeMembers0040
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child37();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4100
     * @tc.name      testInitializeMembers0041
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child38();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4200
     * @tc.name      testInitializeMembers0042
     * @tc.desc      The subclass hides the initial value of the field with the same name of the parent class.
     * The modifier is protected and the type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child39();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4300
     * @tc.name      testInitializeMembers0043
     * @tc.desc      The subclass initializes member variables in the constructor, with the modifier as protected and
     * the type as number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child40();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4400
     * @tc.name      testInitializeMembers0044
     * @tc.desc      The subclass directly initializes its own member variables, the modifier is protected, and
     * the type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child41();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4500
     * @tc.name      testInitializeMembers0045
     * @tc.desc      The subclass initializes its own member variables in the constructor, with the modifier being
     * protected and the type being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child42();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4600
     * @tc.name      testInitializeMembers0046
     * @tc.desc      The subclass modifies the value of the directly initialized member variable in the constructor.
     * The modifier is protected and the type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child43();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4700
     * @tc.name      testInitializeMembers0047
     * @tc.desc      The subclass modifies the value of the directly initialized member variable in the constructor.
     * The modifier is protected and the type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child44();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4800
     * @tc.name      testInitializeMembers0048
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child45();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_4900
     * @tc.name      testInitializeMembers0049
     * @tc.desc      The subclass modifies the value of the parent class constructor and the member variables directly
     * initialized by the parent class and the subclass in the constructor. The modifier is protected and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child46();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(200);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_5000
     * @tc.name      testInitializeMembers0050
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child47();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_5100
     * @tc.name      testInitializeMembers0051
     * @tc.desc      The subclass directly initializes its own member variables. The modifier is public and the type is
     * number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child48();
      let x: number = child.showPrivateVar();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_5200
     * @tc.name      testInitializeMembers0052
     * @tc.desc      The subclass hides the initial value of the field with the same name of the parent class.
     * The modifier is private and the type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child49();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_5300
     * @tc.name      testInitializeMembers0053
     * @tc.desc      The subclass initializes its own member variables in the constructor, with the modifier private
     * and type number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child50();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_5400
     * @tc.name      testInitializeMembers0054
     * @tc.desc      The subclass modifies the value of its own member variable that is directly initialized in the
     * constructor. The modifier is private and the type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child51();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_5500
     * @tc.name      testInitializeMembers0055
     * @tc.desc       In the constructor function, the subclass calls the parent class constructor function and passes
     * in the initial value. The modifier is private and the type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child52();
      let x: number = child.getProtectedValueFromChild();
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number    SUB_INITIALIZE_MEMBERS_TEST_5600
     * @tc.name      testInitializeMembers0056
     * @tc.desc      The subclass directly initializes member variables, with the modifier being internal and the type
     * being number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializeMembers0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child53();
      let x: number = child.constructorPublicVar;
      expect(x).assertEqual(200);
    });
  })
}
