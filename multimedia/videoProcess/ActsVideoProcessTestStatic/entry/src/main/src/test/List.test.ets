'use static';
import abilityTest from "./Ability.test";
import videoProcessorTest from "./VideoProcessor.test";
export default function testsuite() {
  abilityTest();
  videoProcessorTest();
}