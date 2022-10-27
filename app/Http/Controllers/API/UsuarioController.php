<?php
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Requests\Request\CreateUser;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Models\User;

class UsuarioController extends BaseController
{
    public function registroUsuario(CreateUser $request)
    {
        $user=new User();
            $user->name =$request->name;
            $user->email =$request->email;
            $user->password = bcrypt($request->password);
            $user->save();

            $token=$user->createToken('auth_token')->plainTextToken;
            $user->token=$token;
            $user->assignRole('user');
             return response()->json([
                'ok'=>true,
                'user'=>$user
             ]);
            }
    public function login(Request $request)
            {
                if(!Auth::attempt([
                    'email' => $request->email, 
                    'password' => $request->password]))
                    { 
                    return response()
                    -> json(['mensaje'=>'incorrecto']);
                    }
        
                $users = User::where('email', $request['email'])->firstOrFail();
                $users['token']=$users->createToken('auth_token')->plainTextToken;
                return $users ;
                // return $this->sendResponse($users, 'User signed in');
            } 
    
}
