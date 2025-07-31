import ConnectionWithoutNetTest from "./ConnectionWithoutNet.test";
import EmptyTest from './Empty.test'
import connection from '@ohos.net.connection';

let isDefaultNet: boolean = connection.hasDefaultNetSync();
export default function testsuite() {
    if(isDefaultNet){
        EmptyTest();
    }else{
        ConnectionWithoutNetTest();
    }


}
