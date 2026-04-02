import abilityTest from "./Ability.test";
import getAssetsTest from "./photoAccessHelper/PhotoAccessHelper.test";

export default function testsuite(): void {
  abilityTest();
  getAssetsTest();
}