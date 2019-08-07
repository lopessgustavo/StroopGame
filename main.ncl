<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="TesteDeStroop" xmls="http://www.ncl.org.br/NLC3.0/EDTVProfile">
<head>

	<ruleBase>
		<rule id="rAzulAzul" var="img_num" comparator="eq" value="1"/>
		<rule id="rAzulAmarelo" var="img_num" comparator="eq" value="2"/>
		<rule id="rAzulVerde" var="img_num" comparator="eq" value="3"/>
		<rule id="rAzulVermelho" var="img_num" comparator="eq" value="4"/>
		<rule id="rAmareloAzul" var="img_num" comparator="eq" value="5"/>
		<rule id="rAmareloAmarelo" var="img_num" comparator="eq" value="6"/>
		<rule id="rAmareloVerde" var="img_num" comparator="eq" value="7"/>
		<rule id="rAmareloVermelho" var="img_num" comparator="eq" value="8"/>
		<rule id="rVerdeAzul" var="img_num" comparator="eq" value="9"/>
		<rule id="rVerdeAmarelo" var="img_num" comparator="eq" value="10"/>
		<rule id="rVerdeVerde" var="img_num" comparator="eq" value="11"/>
		<rule id="rVerdeVermelho" var="img_num" comparator="eq" value="12"/>
		<rule id="rVermelhoAzul" var="img_num" comparator="eq" value="13"/>
		<rule id="rVermelhoAmarelo" var="img_num" comparator="eq" value="14"/>
		<rule id="rVermelhoVerde" var="img_num" comparator="eq" value="15"/>
		<rule id="rVermelhoVermelho" var="img_num" comparator="eq" value="16"/>
	</ruleBase>

	<regionBase>
		<region id="rgTv">
			<region id="rgFundo" zIndex="5"/>
			<region id="rgFundoRegras" zIndex="4"/>
			<region id="rgFundoJogo" zIndex="1"/>
			<region id="rgLogo" zIndex="6" top="5%" left="20%" width="57%" height="18%"/>
			<region id="rgCor" zIndex="3" top="30%" left="20%" width="60%" height="40%"/>
			<region id="rgBotaoRegras" zIndex="7" width="22%" height="16%" bottom="5%" left="25%" />

			<region id="rgBotaoVermelho" zIndex="7" width="20%" height="15%" bottom="1%" left="1%" />
			<region id="rgBotaoVerde" zIndex="7" width="20%" height="15%" bottom="1%" left="27%" />
			<region id="rgBotaoAmarelo" zIndex="7" width="20%" height="15%" bottom="1%" left="55%" />
			<region id="rgBotaoAzul" zIndex="7" width="20%" height="15%" bottom="1%" left="80%" />

			<region id="rgBotaoIniciar" zIndex="7" width="22%" height="16%" right="25%" bottom="5%"/>
			<region id="rgLua" zIndex="8" />
			<region id="rgGameOver" zIndex="7"/>
			<region id="rgBotaoIniciarRegras" zIndex="7" left="39%" width="22%" height="16%" bottom="0%"/>
		</region>
	</regionBase>
	
	<descriptorBase>
		<descriptor id="dFundo" region="rgFundo"/>
		<descriptor id="dLogo" region="rgLogo"/>
		<descriptor id="dFundoJogo" region="rgFundoJogo"/>
		<descriptor id="dBotaoIniciar" region="rgBotaoIniciar"/>
		<descriptor id="dBotaoRegras" region="rgBotaoRegras"/>
		<descriptor id="dImagem" region="rgCor"/>
		<descriptor id="dLua" region="rgLua" />
		<descriptor id="dGameOver" region="rgGameOver"/>
		<descriptor id="dBotaoIniciarRegras" region="rgBotaoIniciarRegras"/>

		<descriptor id="dBotaoVermelho" region="rgBotaoVermelho" focusIndex="1" moveRight="2" moveLeft="4" focusBorderWidth="4" focusBorderColor="red" selBorderColor="white"/>
		<descriptor id="dBotaoVerde" region="rgBotaoVerde" focusIndex="2" moveRight="3" moveLeft="1" focusBorderWidth="4" focusBorderColor="green" selBorderColor="white"/>
		<descriptor id="dBotaoAmarelo" region="rgBotaoAmarelo" focusIndex="3" moveRight="4" moveLeft="2" focusBorderWidth="4" focusBorderColor="yellow" selBorderColor="white"/>
		<descriptor id="dBotaoAzul" region="rgBotaoAzul" focusIndex="4" moveRight="1" moveLeft="3" focusBorderWidth="4" focusBorderColor="blue" selBorderColor="white"/>

	</descriptorBase>
	
	<connectorBase>
		
		<importBase alias="MeusConectores" documentURI="connectors.ncl"/>

	</connectorBase>
</head>

<body>
	<port id="pInicial" component="Ctx1"/>
		

		<!-- Contexto para Inicio e Regras -->
		<context id="Ctx1">

			<port id="p1" component="fundo"/>
			<media id="fundo" src="Imagens/Fundo.jpg" descriptor="dFundo"/>
			<media id="fundoRegras" src="Imagens/Regras/regras.jpg" descriptor="dFundo"/>
			<media id="logo" src="Imagens/logo2.png" descriptor="dLogo"/>
			<media id="botaoIniciar" src="Imagens/botoes/BotaoIniciar.png" descriptor="dBotaoIniciar"/>
			<media id="botaoIniciarRegras" src="Imagens/botoes/BotaoIniciar.png" descriptor="dBotaoIniciarRegras"/>
			<media id="botaoRegras" src="Imagens/botoes/BotaoRegras.png" descriptor="dBotaoRegras"/>


			<!-- começa a apresentação das imagens da tela de inicio -->

			<link xconnector="MeusConectores#onBeginStartNItems">
				<bind component="fundo" role="onBegin"/>
				<bind component="logo" role="start"/>
				<bind component="botaoIniciar" role="start"/>
				<bind component="botaoRegras" role="start"/>
			</link>

			<!-- Usado para mudar da tela de Inicio para a de Regras -->
			<link xconnector="MeusConectores#onKeySelectionStopNStartN">
				<bind component="fundo" role="onSelection">
					<bindParam name="key" value="RED"/>
				</bind>
				<bind component="fundo" role="stop"/>
				<bind component="botaoIniciar" role="stop"/>
				<bind component="botaoRegras" role="stop"/>
				<bind component="logo" role="stop"/>
				<bind component="fundoRegras" role="start"/>
				<bind component="botaoIniciarRegras" role="start"/>
			</link>

			<!-- Usados para matar o contexto -->
			<link xconnector="MeusConectores#onKeySelectionStop">
				<bind component="fundo" role="onSelection">
					<bindParam name="key" value="GREEN"/>
				</bind>
				<bind component="Ctx1" role="stop"/>
			</link>


			<link xconnector="MeusConectores#onKeySelectionStop">
				<bind component="fundoRegras" role="onSelection">
					<bindParam name="key" value="GREEN"/>
				</bind>
				<bind component="Ctx1" role="stop"/>
			</link>


		</context>


		<!-- Jogo em si -->
		<media id="fundoJogo" src="Imagens/Jogo/FundoJogo2.jpg" descriptor="dFundoJogo"/>
		<media id="telaGameOver" descriptor="dGameOver" src = "Imagens/gameOver.jpg"/>

		<media id="botaoVermelho" descriptor="dBotaoVermelho" src = "Imagens/botoes/Botao Vermelho.png"/>
		<media id="botaoVerde" descriptor="dBotaoVerde" src = "Imagens/botoes/Botao Verde.png"/>
		<media id="botaoAmarelo" descriptor="dBotaoAmarelo" src = "Imagens/botoes/Botao Amarelo.png"/>
		<media id="botaoAzul" descriptor="dBotaoAzul" src = "Imagens/botoes/Botao Azul2.png"/>

		<media id="noDeConfig" type="application/x-ginga-settings">
            <property name="img_num" value="" />
            <property name="service.currentFocus" value='1'/>
    	</media>

    	<media id="script" src="script.lua" descriptor="dLua">
	    	<property name="sortear" value=""/>
	    	<property name="sorteado" value=""/>
	    	<property name="botao_apertado" value=""/>
	    	<property name="game_over" value=""/>
	    	<property name='temp' value='1'/>
	    </media>


    	<switch id="switchDeImagens">

			<bindRule rule="rAzulAzul" constituent="azulAzul"/>
			<bindRule rule="rAzulAmarelo" constituent="azulAmarelo"/>
			<bindRule rule="rAzulVerde" constituent="azulVerde"/>
			<bindRule rule="rAzulVermelho" constituent="azulVermelho"/>
			<bindRule rule="rAmareloAzul" constituent="amareloAzul"/>
			<bindRule rule="rAmareloAmarelo" constituent="amareloAmarelo"/>
			<bindRule rule="rAmareloVerde" constituent="amareloVerde"/>
			<bindRule rule="rAmareloVermelho" constituent="amareloVermelho"/>
			<bindRule rule="rVerdeAzul" constituent="verdeAzul"/>
			<bindRule rule="rVerdeAmarelo" constituent="verdeAmarelo"/>
			<bindRule rule="rVerdeVerde" constituent="verdeVerde"/>
			<bindRule rule="rVerdeVermelho" constituent="verdeVermelho"/>
			<bindRule rule="rVermelhoAzul" constituent="vermelhoAzul"/>
			<bindRule rule="rVermelhoAmarelo" constituent="vermelhoAmarelo"/>
			<bindRule rule="rVermelhoVerde" constituent="vermelhoVerde"/>
			<bindRule rule="rVermelhoVermelho" constituent="vermelhoVermelho"/>


			<media id="azulAzul" src="Imagens/Cores2/AzulAzul.png" descriptor="dImagem"/>
			<media id="azulAmarelo" src="Imagens/Cores2/AzulAmarelo.png" descriptor="dImagem"/>
			<media id="azulVerde" src="Imagens/Cores2/AzulVerde.png" descriptor="dImagem"/>
			<media id="azulVermelho" src="Imagens/Cores2/AzulVermelho.png" descriptor="dImagem"/>

			<media id="amareloAzul" src="Imagens/Cores2/AmareloAzul.png" descriptor="dImagem"/>
			<media id="amareloAmarelo" src="Imagens/Cores2/AmareloAmarelo.png" descriptor="dImagem"/>
			<media id="amareloVerde" src="Imagens/Cores2/AmareloVerde.png" descriptor="dImagem"/>
			<media id="amareloVermelho" src="Imagens/Cores2/AmareloVermelho.png" descriptor="dImagem"/>

			<media id="verdeAzul" src="Imagens/Cores2/VerdeAzul.png" descriptor="dImagem"/>
			<media id="verdeAmarelo" src="Imagens/Cores2/VerdeAmarelo.png" descriptor="dImagem"/>
			<media id="verdeVerde" src="Imagens/Cores2/VerdeVerde.png" descriptor="dImagem"/>
			<media id="verdeVermelho" src="Imagens/Cores2/VerdeVermelho.png" descriptor="dImagem"/>

			<media id="vermelhoAzul" src="Imagens/Cores2/VermelhoAzul.png" descriptor="dImagem"/>
			<media id="vermelhoAmarelo" src="Imagens/Cores2/VermelhoAmarelo.png" descriptor="dImagem"/>
			<media id="vermelhoVerde" src="Imagens/Cores2/VermelhoVerde.png" descriptor="dImagem"/>
			<media id="vermelhoVermelho" src="Imagens/Cores2/VermelhoVermelho.png" descriptor="dImagem"/>

		</switch>

		<!-- Conectores -->

		<link xconnector="MeusConectores#onEndStart">
			<bind component="Ctx1" role="onEnd"/>
			<bind component="fundoJogo" role="start"/>
		</link>

		<!-- <link xconnector="MeusConectores#onBeginStartNItems">
			<bind component="fundoJogo" role="onBegin"/>
			<bind component="script" role="start"/>
			<bind component="botaoVermelho" role="start"/>
			<bind component="botaoVerde" role = "start"/>
			<bind component="botaoAmarelo" role = "start"/>
			<bind component="botaoAzul" role = "start"/>
		</link> -->


		<!-- tentativa de nao user o onBeginStartNItems acima -->
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="fundoJogo" role="onBegin"/>
			<bind component="script" role="start"/>
		</link>
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="script" role="onBegin"/>
			<bind component="botaoVermelho" role="start"/>
		</link>
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="botaoVermelho" role="onBegin"/>
			<bind component="botaoVerde" role="start"/>
		</link>
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="botaoVermelho" role="onBegin"/>
			<bind component="botaoAmarelo" role="start"/>
		</link>
		<link xconnector="MeusConectores#onBeginStart">
			<bind component="botaoAmarelo" role="onBegin"/>
			<bind component="botaoAzul" role="start"/>
		</link>


		<!-- usado para começar o sorteio das imagens no script -->
		<link xconnector="MeusConectores#onBeginSet">
	 		<bind component="botaoAzul" role="onBegin"/>
	 		<bind component="script" interface="sortear" role="set">
	 			<bindParam name="var" value='-1'/>
	 		</bind>
	 	</link>

	 	<!-- Controle do switch -->
	 	<link xconnector="MeusConectores#onEndAttributionStop">
	 		<bind component="script" interface="botao_apertado" role="onEndAttribution"/>
	 		<bind component="switchDeImagens" role="stop"/>
	 	</link>

	 	<link xconnector="MeusConectores#onEndAttributionSet">
	            <bind component="script" interface="sorteado" role="onEndAttribution"/>
	            <bind component="script" interface="sorteado" role="get" />
	            <bind component="noDeConfig" interface="img_num" role="set">
	                <bindParam name="var" value="$get"/>
	            </bind>
	    </link>

	 
	    <link xconnector="MeusConectores#onEndAttributionStartDelay">
	            <bind component="noDeConfig" interface="img_num" role="onEndAttribution"/>
	            <bind component="switchDeImagens" role="start">
	                <bindParam name="delay" value="0.1s" />
	            </bind>
	    </link>




    <!-- Comandos do Jogo -->


    <!-- Botao Vermelho -->
	<link xconnector="MeusConectores#onKeySelectionSet">
		<bind component="fundoJogo" role="onSelection">
			<bindParam name="key" value="RED"/>
		</bind>
		<bind component="script" interface="botao_apertado" role="set">
 			<bindParam name="var" value='RED'/>
 		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoVermelho" role="onSelection"/>
		<bind component="script" interface="botao_apertado" role="set">
			<bindParam name="var" value="RED"/>
		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoVermelho" role="onSelection"/>
		<bind component="script" interface="temp" role="set">
			<bindParam name="var" value="1"/>
		</bind>
	</link>

	<link xconnector='MeusConectores#onEndAttributionSet'>
		<bind component='script' interface='temp' role='onEndAttribution'/>
		<bind component='script' interface='temp' role='get'/>
		<bind component='noDeConfig' interface='service.currentFocus' role='set'>
			<bindParam name='var' value='1'/>
		</bind>
	</link>

	<!-- Botao Verde -->
	
	<link xconnector="MeusConectores#onKeySelectionSet">
		<bind component="fundoJogo" role="onSelection">
			<bindParam name="key" value="GREEN"/>
		</bind>
		<bind component="script" interface="botao_apertado" role="set">
 			<bindParam name="var" value='GREEN'/>
 		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoVerde" role="onSelection"/>
		<bind component="script" interface="botao_apertado" role="set">
			<bindParam name="var" value="GREEN"/>
		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoVerde" role="onSelection"/>
		<bind component="script" interface="temp" role="set">
			<bindParam name="var" value="2"/>
		</bind>
	</link>


	<!-- Botao Amarelo -->
	
	<link xconnector="MeusConectores#onKeySelectionSet">
		<bind component="fundoJogo" role="onSelection">
			<bindParam name="key" value="YELLOW"/>
		</bind>
		<bind component="script" interface="botao_apertado" role="set">
 			<bindParam name="var" value='YELLOW'/>
 		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoAmarelo" role="onSelection"/>
		<bind component="script" interface="botao_apertado" role="set">
			<bindParam name="var" value="YELLOW"/>
		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoAmarelo" role="onSelection"/>
		<bind component="script" interface="temp" role="set">
			<bindParam name="var" value="3"/>
		</bind>
	</link>


	<!-- Botao Azul -->
	
	<link xconnector="MeusConectores#onKeySelectionSet">
		<bind component="fundoJogo" role="onSelection">
			<bindParam name="key" value="BLUE"/>
		</bind>
		<bind component="script" interface="botao_apertado" role="set">
 			<bindParam name="var" value='BLUE'/>
 		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoAzul" role="onSelection"/>
		<bind component="script" interface="botao_apertado" role="set">
			<bindParam name="var" value="BLUE"/>
		</bind>
	</link>

	<link xconnector="MeusConectores#onSelectionSet">
		<bind component="botaoAzul" role="onSelection"/>
		<bind component="script" interface="temp" role="set">
			<bindParam name="var" value="4"/>
		</bind>
	</link>


	<!-- onde mostra o game over -->
    <link xconnector="MeusConectores#onEndAttributionStart">
		<bind component="script" interface="game_over" role="onEndAttribution"/>
        <bind component="telaGameOver" role="start"/>
    </link>

    <link xconnector="MeusConectores#onBeginStop">
    	<bind component="telaGameOver" role="onBegin"/>
    	<bind component="fundoJogo" role="stop"/>
    </link>

	<!-- Botao Verde para parar o script -->
	<link xconnector="MeusConectores#onKeySelectionStop">
		<bind component="telaGameOver" role="onSelection">
			<bindParam name="key" value="GREEN"/>
		</bind>
		<bind component="script" role="stop"/>
	</link>

	<link xconnector="MeusConectores#onEndStop">
		<bind component="script" role="onEnd"/>
		<bind component="telaGameOver" role="stop"/>
	</link>

	<link xconnector="MeusConectores#onEndStopNItems">
		<bind component="telaGameOver" role="onEnd"/>
		<bind component="fundoJogo" role="stop"/>
		<bind component="botaoVermelho" role="stop"/>
		<bind component="botaoVerde" role="stop"/>
		<bind component="botaoAmarelo" role="stop"/>
		<bind component="botaoAzul" role="stop"/>
	</link>

	<link xconnector="MeusConectores#onEndStart">
		<bind component="telaGameOver" role="onEnd"/>
		<bind component="Ctx1" role="start"/>
	</link>


    

</body>
</ncl>