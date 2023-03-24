
<!-- README.md is generated from README.Rmd. Please edit that file -->

# doutorado

<!-- badges: start -->
<!-- badges: end -->

Tese de doutorado do Julio Trecenti, em português, na versão web e PDF.
Este repositório não contém a versão oficial da tese, e sim a versão
mais recente.

[Versão Web](https://jtrecenti.github.io/doutorado/)

[Versão
PDF](https://jtrecenti.github.io/doutorado/Resolvendo-Captchas.pdf)

[Apresentação da defesa](https://jtrecenti.github.io/doutorado/defesa/)

## Resumo

Captcha (Completely Automated Public Turing tests to tell Computers and
Humans Apart), é um desafio utilizado para identificar se o acesso à uma
página na internet é realizada por uma pessoa ou uma máquina. O desafio
é projetado para ser fácil de resolver por humanos, mas difícil de
resolver por máquinas. A utilização de Captchas em serviços públicos
pode ser prejudicial à população, limitando o acesso a dados e
incentivando empresas a contratarem serviços que utilizam mão de obra
humana para resolução dos Captchas. Este trabalho tem como foco os
Captchas com textos (números e letras) em imagens. Já existem soluções
para resolver Captchas deste tipo utilizando aprendizado de máquinas,
sendo as redes neurais profundas os modelos com melhor desempenho. No
entanto, esses modelos precisam de grandes bases de dados anotadas ou de
procedimentos de ajuste intrincados e pouco acessíveis. Neste trabalho,
é proposto um método inovador, chamado Web Automatic Weak Learning
(WAWL), que alia técnicas de raspagem de dados e aprendizado de máquinas
com rótulos parciais, utilizando dados obtidos automaticamente da
internet para acelerar o ajuste dos modelos. O método é agnóstico à
arquitetura utilizada para o modelo, sendo necessário realizar apenas
uma adaptação na função de perda. O método apresenta resultados
significativos, aumentando a acurácia inicial de modelos fracos em mais
de 30% nos mais de 10 Captchas estudados, sem a necessidade de realizar
uma nova rodada anotação manual. Adicionalmente, um novo pacote
computacional de uso livre foi desenvolvido para resolver Captchas e
disponibilizar os resultados publicamente. Espera-se que o trabalho
possa reduzir o incentivo econômico de contratar serviços que utilizam
mão de obra humana para resolver Captchas.

**Palavras-chave**: captcha; aprendizado de máquinas; aprendizado
estatístico; aprendizado fracamente supervisionado; rótulos parciais;
rótulos complementares; raspagem de dados.

## Abstract

Captchas, or Completely Automated Public Turing tests to tell Computers
and Humans Apart, are challenges designed to differentiate between human
and machine access to web pages. While Captchas are intended to be easy
for humans to solve, they can pose a challenge for machines. Their use
in public services can limit access to public data and incentivize
companies to hire services that use human labor to solve them. In this
work, we propose a new method called Web Automatic Weak Learning (WAWL),
which combines web scraping and machine learning with partial labels
techniques to quickly and accurately fit models to solve Captchas with
text in images. Our method is agnostic to the model architecture and
only requires a small adaptation of the loss function. By increasing the
accuracy of weak initial models by more than 30% on various Captchas
studied, our method can reduce the economic incentive to hire services
that use human labor to solve Captchas. We have also developed a
computational package to easily solve Captchas and make our results
available to the developer community.

**Keywords**: captcha; machine learning; statistical learning; weak
supervised learning; partial label; complementary label; web scraping.

## Links de interesse

- Pacote [`{captcha}`](https://github.com/decryptr/captcha)
- Pacote [`{captchaOracle}`](https://github.com/jtrecenti/captchaOracle)
- [Associação Brasileira de Jurimetria](https://abj.org.br)
