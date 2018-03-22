DEFAULT: start

setup-network:
	@./scripts/print.sh prefix "Starting Docker containers..."
	@docker-compose up -d --build --remove-orphans --force-recreate > /dev/null
	@./scripts/print.sh prefix "Waiting for network..." false
	@./scripts/ping.sh
	@./scripts/print.sh prefix "Network running! 🎉"

start: setup-network
	@./scripts/print.sh prefix "Attaching terminal to neo-python client\n"
	@./scripts/print.sh grey "Open wallet (password: 'coz'):\t open wallet ./neo-privnet.wallet"
	@./scripts/print.sh grey "Test smart contract:\t\t build /smart-contracts/wake_up_neo.py test 07 05 True False main\n"
	@docker exec -it neo-python np-prompt -p -v

stop:
	@./scripts/print.sh "Stopping Docker containers..."
	@docker-compose down > /dev/null
	@./scripts/print.sh "Done 🎉"
