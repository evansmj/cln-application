import handleError from '../shared/error-handler.js';
import { LNMessage } from '../service/lightning.service.js';
import { logger } from '../shared/logger.js';
const lnMessage = LNMessage;
class LightningController {
    callMethod(req, res, next) {
        try {
            logger.info('Calling method: ' + req.body.method);
            lnMessage
                .call(req.body.method, req.body.params)
                .then((commandRes) => {
                logger.info('Controller received response for ' +
                    req.body.method +
                    ': ' +
                    JSON.stringify(commandRes));
                if (req.body.method && req.body.method === 'listpeers') {
                    // Filter out ln message pubkey from peers list
                    const lnmPubkey = lnMessage.getLNMsgPubkey();
                    commandRes.peers = commandRes.peers.filter((peer) => peer.id !== lnmPubkey);
                    res.status(200).json(commandRes);
                }
                else {
                    res.status(200).json(commandRes);
                }
            })
                .catch((err) => {
                logger.error('Controller caught lightning error from ' +
                    req.body.method +
                    ': ' +
                    JSON.stringify(err));
                return handleError(err, req, res, next);
            });
        }
        catch (error) {
            return handleError(error, req, res, next);
        }
    }
}
export default new LightningController();
