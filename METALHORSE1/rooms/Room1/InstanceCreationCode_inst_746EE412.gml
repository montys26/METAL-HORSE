//wave, type, spawnpoint, delay

waves = ds_list_create();
ds_list_add(waves, [0, oEnemyA, 0, 0]);
//ds_list_add(waves, [0, oEnemyA, 0, 100]);
//ds_list_add(waves, [0, oEnemyA, 0, 200]);
//ds_list_add(waves, [0, oEnemyA, 1, 0]);
//ds_list_add(waves, [0, oEnemyA, 1, 100]);
//ds_list_add(waves, [0, oEnemyA, 1, 200]);


ds_list_add(waves, [1, oEnemyB, 1, 10]);
ds_list_add(waves, [1, oEnemyB, 0, 100]);


ds_list_add(waves, [2, oEnemyB, 1, 100]);
//ds_list_add(waves, [2, oEnemyA, 0, 0]);
//ds_list_add(waves, [2, oEnemyA, 0, 20]);
//ds_list_add(waves, [2, oEnemyA, 0, 40]);
//ds_list_add(waves, [2, oEnemyA, 0, 60]);


spawn [0,0]= 2000;
spawn[0,1] = 500;
spawn[1,0] = 1100;
spawn[1,1] = 500;