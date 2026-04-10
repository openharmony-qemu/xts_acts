import abilityTest from "./Ability.test";
import FetchResultStatic from "./FetchResult/FetchResult.test";
import PhotoAssetStatic from "./PhotoAsset/PhotoAsset.test";
export default function testsuite(): void {
  abilityTest();
  PhotoAssetStatic();
  FetchResultStatic();
}