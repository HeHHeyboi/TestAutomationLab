package main

import (
	"os"

	"github.com/gin-gonic/gin"
)

// type UserData struct {
// 	FirstName    string `form:"firstname"`
// 	LastName     string `form:"lastname"`
// 	Organization string `form:"organization"`
// 	Email        string `form:"email"`
// 	Phone        string `form:"phone"`
// }

func main() {
	gin.SetMode(gin.ReleaseMode)
	if len(os.Args) > 1 {
		if os.Args[1] == "debug" {
			gin.SetMode(gin.DebugMode)
		}
	}
	router := gin.Default()
	// router.LoadHTMLFiles("./Registration.html", "./Success.html")
	lab4 := router.Group("/Lab4")
	lab4.StaticFile("/Success.html", "./Success.html")
	lab4.StaticFile("/Registration.html", "./Registration.html")

	// router.GET("/", func(ctx *gin.Context) {
	// 	ctx.String(http.StatusOK, "Server is on")
	// })
	// router.GET("/Register", func(ctx *gin.Context) {
	// 	ctx.HTML(http.StatusOK, "Registration.html", nil)
	// })
	// router.POST("/Success", func(ctx *gin.Context) {
	// 	var u UserData
	// 	ctx.Bind(&u)
	// 	fmt.Printf("%v\n\n%+v\n\n%#v\n\n%T\n", u, u, u, u)
	// 	ctx.HTML(http.StatusOK, "Success.html", gin.H{})
	// })

	router.Run("localhost:8080")
}
