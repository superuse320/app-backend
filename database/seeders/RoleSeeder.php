<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
// use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role1= Role::create(['name' => 'admin']);
        $role4= Role::create(['name' => 'Usuario']);
        
        
        Permission::create(['name' => 'admin.home']) ->assignRole([$role1]);
        Permission::create(['name' => 'Usuario.home']) ->assignRole([$role4]);
        // $User::create([
        //     'name'=>'juan',
        //     'email'=>'juan@gmail.com',
        //     'password'=> bcrypt('123456')
        // ])->assignRole('admin');

        // $User::factory(9)->create();



    }
}
