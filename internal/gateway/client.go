package gateway

import "github.com.br/marcelofelixsalgado/fullcycle-eda-walletcore/internal/entity"

type ClientGateway interface {
	Get(id string) (*entity.Client, error)
	Save(client *entity.Client) error
}
