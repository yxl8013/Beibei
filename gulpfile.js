var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('compileSass',function(){
    gulp.src('./src/sass/*.scss')
    .pipe(sass({outputStyle:'expanded'}).on('error' ,sass.logError))
    .pipe(gulp.dest('./src/css'))
});
gulp.task('jtsass',function(){
    gulp.watch('./src/sass/*.scss',['compileSass'])
});

var browserSync = require('browser-sync');
gulp.task('server',()=>{
    browserSync({
        server: './src/',
        // proxy : 'http://localhost:8013',
        port:88,
        files : ['./src/**/*.html','./src/css/*.css']
    });
    gulp.watch('./src/sass/*.scss',['compileSass'])
})