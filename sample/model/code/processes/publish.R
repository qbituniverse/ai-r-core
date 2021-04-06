#* Test ping message
#' @serializer unboxedJSON
#* @get /api/ping
function() {
    return("Ok")
}

#* Error
#* @get /api/error
function(res) {
    msg <- "Your request did not include a required parameter."
    res$status <- 400
    return(list(error = jsonlite::unbox(msg)))
}
