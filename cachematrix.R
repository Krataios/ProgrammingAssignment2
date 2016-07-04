

# makeCacheMatrix ifuncion donde retorna una lista de
# esta matriz almacena en cache un valor de la inversa
# * setMatrix      escoje el valor de la matriz
# * getMatrix   obtiene el valoe de la matriz
# * cacheInverse   escojel valor en cache de la inversa
# * getInverse    obtiene el valor  en cache

makeCacheMatrix <- function(x = numeric()) {
      #inicia el valor null en cache  previniendo una ausencia delm mismo 
        cache <- NULL
        
        # guarada la matrz 
        setMatrix <- function(newValue) {
                x <<- newValue
           
                cache <<- NULL
        }

      # reorna la matrz escogida en cahe 
        getMatrix <- function() {
                x
        }

        # cache da el argumento a colocar en la matrz 
        cacheInverse <- function(solve) {
                cache <<- solve
        }

        # gobteniendo el valor en cache 
        getInverse <- function() {
                cache
        }
        
        # rretrona una lista especificando 
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

# calcular l a inversa con lo anterior
cacheSolve <- function(y, ...) {
        # get the cached value
        inverse <- y$getInverse()
        # if a cached value exists return it
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        

        # la coloca en cache a la matriz 
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        
        # llamamos a la inversa 
        inverse
}
