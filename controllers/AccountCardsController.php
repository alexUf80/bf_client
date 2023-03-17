<?php

class AccountCardsController extends Controller
{
    public function fetch()
    {
        if (empty($this->user)) {
            header('Location: /lk/login');
            exit;
        }

        if (array_key_exists($this->request->get(), ['remove', 'base'])) {
            if (!empty($_SESSION['looker_mode']))
                return false;

            $cardId = $this->request->get('remove') ? $this->request->get('remove') : $this->request->get('base');

            $card = CardsORM::find($cardId);

            if ($card->user_id != $this->user->id)
                return false;

            if ($this->request->get('remove'))
                $this->removeCard($cardId);
            else
                $this->setBaseCard($cardId);
        }

        $cards = CardsORM::where('user_id', $this->user->id)->get();
        $this->design->assign('cards', $cards);

        return $this->design->fetch('account/cards.tpl');
    }

    private function removeCard($id)
    {
        $countUserCards = CardsORM::where('user_id', $this->user->id)->get()->count();

        if (count($countUserCards) <= 1) {
            $this->design->assign('error', 'Нельзя удалить единственную карту');
        } else {
            $thisCard = CardsORM::find($id);
            CardsORM::destroy($id);

            if ($thisCard->base_card == 1) {
                $lastCard = CardsORM::where('user_id', $this->user->id)->orderBy('id', 'desc')->first();
                CardsORM::where('id', $lastCard->id)->update(['base_card' => 1]);
            }

            header('Location: ' . $this->request->url(array('remove' => null)));
            exit;
        }
    }

    private function setBaseCard($id)
    {
        CardsORM::where('user_id', $this->user->id)->update(['base_card' => 0]);
        CardsORM::where('id', $id)->update(['base_card' => 1]);

        header('Location: ' . $this->request->url(array('base' => null)));
        exit;
    }

}