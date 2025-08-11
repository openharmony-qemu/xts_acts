import ConnectionTest from "./Connection.test";
import ConnectionPublicTest from "./ConnectionPublic.test";
import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';

let isDefaultNet: boolean = connection.hasDefaultNetSync();

export default function testsuite() {
    if(isDefaultNet){
        ConnectionTest();
        ConnectionPublicTest();
    }else{
        EmptyTest();
    }

}
