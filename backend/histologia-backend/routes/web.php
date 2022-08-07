<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function() use($router) { return $router->app->version(); } );

Route::group(['prefix' => 'sheet'], function () {
    Route::post('/', 'SheetController@store');
    Route::get('/{idsheet}', 'SheetController@get');
    Route::get('/slides/{idsheet}', 'SheetController@countSlide');
});

Route::group(['prefix' => 'slide'], function() {

});