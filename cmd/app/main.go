package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		render(w, "test.page.gohtml")
	})

	fmt.Println("Starting front end service on port 4002")
	err := http.ListenAndServe(":4002", nil)
	if err != nil {
		log.Panic(err)
	}
}

func render(w http.ResponseWriter, t string) {

	partials := []string{
		"./cmd/app/templates/base.layout.gohtml",
		"./cmd/app/templates/header.partial.gohtml",
		"./cmd/app/templates/footer.partial.gohtml",
	}

	var templateSlice []string
	templateSlice = append(templateSlice, partials...)
	templateSlice = append(templateSlice, fmt.Sprintf("./cmd/app/templates/%s", t))

	tmpl, err := template.ParseFiles(templateSlice...)

	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	if err := tmpl.ExecuteTemplate(w, "base", nil); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}
