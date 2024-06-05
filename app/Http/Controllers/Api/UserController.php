<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Interfaces\UserInterface;
use App\Repositories\UserRepository;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use \Illuminate\Support\Str;

class UserController extends Controller
{
    // private UserRepository $userRepository;

    public function __construct(UserInterface $userRepository)
    {
        $this->userRepository = $userRepository;
    }
    
    public function logincheck(Request $request) {
        $response = $this->userRepository->otpGenerate($request->mobile);
        return response()->json($response);
    }

    public function otpcheck(Request $request) {
        $response = $this->userRepository->otpcheck($request->mobile, $request->otp);
        return response()->json($response);
    }
    
}
