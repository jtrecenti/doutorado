convolve <- function(img, kern) {
  # monta a bordinha na imagem. A borda deve ter (tamanho kernel) / 2,
  # de tamanho, arredondando para baixo
  pad <- floor(dim(kern)[1] / 2)
  img_pad <- matrix(0, nrow = nrow(img) + 2 * pad, ncol = ncol(img) + 2 * pad)
  img_pad[pad + 1:nrow(img), pad + 1:ncol(img)] <- img[,,1]
  # aplica a convolução nos pontos da imagem
  for (i in seq_len(nrow(img))) {
    for (j in seq_len(ncol(img))) {
      img[i, j, 1] <- sum(img_pad[i + 0:(2 * pad), j + 0:(2 * pad)] * kern)
    }
  }
  img[,,2] <- img[,,3] <- img[,,1]
  img
}
