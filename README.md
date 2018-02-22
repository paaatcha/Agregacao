# Agregação de classificadores
Neste repositório estão os códigos utilizados para minha dissertação de mestrado, com título: [Agregação de classificadores neurais via integral de Choquet com respeito a uma medida fuzzy](https://www.dropbox.com/s/8jogzemlequaxni/Disserta%C3%A7%C3%A3o%20-%20Andr%C3%A9%20Pacheco.pdf?dl=0)

Neste trabalho foram utilizados 3 classificadores neurais:
* [Feedforward neural network (FNN)](https://github.com/paaatcha/Agregacao/tree/master/FNN)
* [Extreme learning machine (ELM)](https://github.com/paaatcha/Agregacao/tree/master/ELM)
* [Discriminative restricted Boltzmann machine (DRBM)](https://github.com/paaatcha/Agregacao/tree/master/DeeBNet)

Além disso, o classificador clássico [K-vizinhos mais próximos (KNN)](https://github.com/paaatcha/Agregacao/tree/master/KNN) também foi utilizado com intuito de comparação.

A agregação dos classificadores é realizada por meio da [integral de Choquet](https://github.com/paaatcha/Agregacao/tree/master/AlgoritmosAgregacao/ChoquetIntegral/) com respeito a uma [medida fuzzy](https://github.com/paaatcha/Agregacao/tree/master/FuzzyMeasure). Na dissertação, a medida fuzzy é calculada de acordo com
o algoritmo descrito em \[1\]. Além disso, [outros métodos](https://github.com/paaatcha/Agregacao/tree/master/Outros) são utilizados para comparação.

No trabalho são utilizadas diversas bases de dados que podem ser baixadas no [UCI repository](http://archive.ics.uci.edu/ml/index.php).

Para realizar a agregação via a integral de Choquet, basta carregar a matriz a ser agregada (lembrando que o código agrega por linha) no workspace do MATLAB e chamar a função aggChoquet() dentro do arquivo aggChoquet.m.
Essa função já chama as demais funções para cálculo da medida fuzzy e irá retornar o dado já agregado.

Qualquer erro encontrado no código ou dúvidas sobre o mesmo, entre em contato via email.

