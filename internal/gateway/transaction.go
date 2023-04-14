package gateway

import "github.com.br/marcelofelixsalgado/fullcycle-eda-walletcore/internal/entity"

type TransactionGateway interface {
	Create(transaction *entity.Transaction) error
}
