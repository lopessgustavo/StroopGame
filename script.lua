math.randomseed(os.time())

-- descomentar para utiliza o mqtt
-- local socket = require 'socket'
-- local mqtt = require 'paho.mqtt'
-- local client = mqtt.client.create('10.42.0.1',1883)
-- client:auth('sakhlfvx','3RKpMDJB89aL')
-- client:connect("Gustavo")



local img_exibida
local acertos = 0
local erros = 0
local rodada = 0
local img = 0
local fim = 0
local t0 = os.time()
local ultImagem = 0

-- descomentar para usar efeito de luz
-- function acender_led(img_exibida)
-- 	if (img_exibida==4 or img_exibida==8 or img_exibida==12 or img_exibida==16) then
-- 		client:publish("botao_apertado","VERMELHO")
-- 	elseif (img_exibida==3 or img_exibida==7 or img_exibida==11 or img_exibida==15) then
-- 		client:publish("botao_apertado","VERDE")
-- 	elseif (img_exibida==2 or img_exibida==6 or img_exibida==10 or img_exibida==14) then
-- 		client:publish("botao_apertado","AMARELO")
-- 	elseif (img_exibida==1 or img_exibida==5 or img_exibida==9 or img_exibida==13) then
-- 		client:publish("botao_apertado","AZUL")
-- 	end
-- end
	

function sortear(img_exibida)
	valorNovo = math.random(1,16)
	while valorNovo == img_exibida do
		valorNovo = math.random(1,16)
	end
	-- acender_led(valorNovo)
	return(valorNovo)
end

function contarAcertos(valorPressionado)
	if valorPressionado=="RED" and (img_exibida==4 or img_exibida==8 or img_exibida==12 or img_exibida==16) then
		acertos = acertos +1
	elseif valorPressionado=="GREEN" and (img_exibida==3 or img_exibida==7 or img_exibida==11 or img_exibida==15) then
		acertos = acertos +1
	elseif valorPressionado=="YELLOW" and (img_exibida==2 or img_exibida==6 or img_exibida==10 or img_exibida==14) then
		acertos = acertos +1
	elseif valorPressionado=="BLUE" and (img_exibida==1 or img_exibida==5 or img_exibida==9 or img_exibida==13) then
		acertos = acertos +1
	else
		erros = rodada - acertos
	end

end



function postar_evento( classeEvento, tipoEvento, nomeEvento, valorEvento )
	novoEvento = {
		class = classeEvento;
		type = tipoEvento;
		name = nomeEvento;
		value = valorEvento;
	}
		novoEvento.action = 'start'
		event.post(novoEvento) 
		novoEvento.action = 'stop'
		event.post(novoEvento)
		print("evento postado")
end

function gameOver()
	print("Game Over")
	tabelaTempo = atualiza_tempo_decorrido(t0)
	fim = 1
	width, height = canvas:attrSize()
	canvas:attrFont("vera", 50)
	canvas:attrColor("black")
	x = width/2 - 200
	y = height/2 - 50  
	canvas:drawText(x,y,"Você acertou:"..acertos.."/"..rodada)
	canvas:flush()
	local msg_tempo = string.format("Tempo: %02.f:%02.f:%02.f", tabelaTempo.hor, tabelaTempo.min, tabelaTempo.seg)
	canvas:drawText(width/2 - 200, height/2 - 100, msg_tempo)
	canvas:flush()
	postar_evento('ncl', 'attribution', 'game_over','true')
	acertos = 0
	erros = 0
	rodada = 0

end

function atualiza_tempo_decorrido(tempoInicio)
	local tempoFim = os.time()
	--Obtem horas, minutos e segundos desde 'tempoInicio' ate 'tempoFim'.
	local tempoTotal = tempoFim - tempoInicio
	local horas = tempoTotal / (60*60)
	local minutos = (tempoTotal % (60*60)) / (60)
	local segundos = (tempoTotal % (60*60)) % (60)
	--Retorna uma tabela com os dados de tempo obtidos acima.
	return { 
		hor = horas;
		min = minutos;
		seg = segundos;
	}
end

function handler(event)
	if event.class ~= "ncl" then return end
	if event.type ~= "attribution" then return end
	if rodada == 10 then contarAcertos(event.value); gameOver()
	
	elseif event.name == "sortear" and fim == 0  then
		print("Entrei 1")
		img_exibida = sortear(img_exibida)
		rodada = rodada + 1
		postar_evento("ncl", "attribution", "sorteado", img_exibida)
		
	
	elseif event.name=="botao_apertado" then
		if	event.value =="RED" and fim==0  then
			contarAcertos(event.value)
			img_exibida = sortear(img_exibida)
			rodada = rodada + 1
			postar_evento("ncl", "attribution", "sorteado", img_exibida)
			
		
		elseif event.value =="GREEN" and fim==0  then
			contarAcertos(event.value)
			img_exibida = sortear(img_exibida)
			rodada = rodada + 1
			postar_evento("ncl", "attribution", "sorteado", img_exibida)
			
		
		elseif event.value =="YELLOW" and fim==0 then
			contarAcertos(event.value)
			img_exibida = sortear(img_exibida)
			rodada = rodada + 1
			postar_evento("ncl", "attribution", "sorteado", img_exibida)
			
		
		elseif event.value =="BLUE" and fim==0  then
			contarAcertos(event.value)
			img_exibida = sortear(img_exibida)
			rodada = rodada + 1
			postar_evento("ncl", "attribution", "sorteado", img_exibida)
			
		end
	end
	print("Rodada: "..rodada)

end
event.register(handler)