package routes

import (
	"apigateway/internal/app"
	"net/http"

	"github.com/graph-gophers/graphql-go/relay"
)

func Configure(mux *http.ServeMux) {
	mux.Handle("/graphql", &relay.Handler{Schema: app.Schema})
}
