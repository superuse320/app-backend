<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Requests\Request\CreateUser;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Models\User;
   
class AuthController extends BaseController
{
    // public function log(Request $request)
    // {
    //     if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
    //         $authUser = Auth::user(); 
    //         $success['token'] =  $authUser->createToken('auth_token')->plainTextToken; 
    //         $success['name'] =  $authUser->name;
   
    //         return $this->sendResponse($success, 'User signed in');
    //     } 
    //     else{ 
    //         return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
    //     } 
    // }
    public function listado (){
        $user=User::all();
        return $user;

    }
    public function registro(Request $request)
    {
            $request->validate([
                'name'=>'required',
                'email'=>'required|email|unique:users',
                'password'=>'required',
            ]);

            $user=new User();
            $user->name =$request->name;
            $user->email =$request->email;
            $user->password = bcrypt($request->password);
            $user->save();

            $token=$user->createToken('auth_token')->plainTextToken;
            $user->token=$token;
            $user->assignRole('Usuario');
             return response()->json([
                'ok'=>true,
             ]);
            }

    public function login(Request $request)
    {
        if(!Auth::attempt([
            'email' => $request->email, 
            'password' => $request->password]))
            { 
            return response()
            -> json(false);

            }
        

        $users = User::where('email', $request['email'])->firstOrFail();
        $users['token']=$users->createToken('auth_token')->plainTextToken;
        return $users ;
        // return $this->sendResponse($users, 'User signed in');
    }
}



