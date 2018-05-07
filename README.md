# KICKSTART EM 2 MINUTOS  
:rocket:  
1.  Subir o Mattermost `docker-compose up -d mattermost`  
2.  Configurar Hooks e Atualizar URL e TOKEN no arquivo `bender.env`  
3.  Criar aquivo de password para o Jenkins `echo "Passw0rd18" > ~/.ssh/.password`
4.  Subindo Bender, Netdata, Jenkins `docker-compose up -d bender jenkins netdata`