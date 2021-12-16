
let g:weather#appid = '32383b48c5dd6b075a063a061c92a845'
let g:weather#area = 'Atlanta'
let g:weather#unit = 'metric'
let g:CurrentWeather = ''
let g:TodayWeather = ''
" command! CurrentWeather :put = g:CurrentWeather
command! CurrentWeather :exec Func3()
" command! TodayWeather :put = g:TodayWeather
command! TodayWeather :exec Func4()
function Func3()
    :Weather Atlanta
    :put = g:CurrentWeather
endfunction
function Func4()
    :Weather Atlanta
    :put = g:TodayWeather
endfunction
