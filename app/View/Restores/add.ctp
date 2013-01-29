<?php echo $this->Html->css('livevalidation'); ?>
<?php echo $this->Html->script('livevalidation', array('inline' => false)); ?>
<script type="text/javascript">
    $(document).ready(function() {
        /*
         * Live Validation
         */
        
        var RestoreAdd = {
            ReportedYear: new LiveValidation('RestoreReportedYear'),
            Stage: new LiveValidation('RestoreStage'),
            HomeId: new LiveValidation('RestoreHomeId'),
            AwayId: new LiveValidation('RestoreAwayId'),
            ScoreH: new LiveValidation('RestoreScoreH'),
            ScoreA: new LiveValidation('RestoreScoreA')
        };
        
        Validate.ResultEquality = function() {
            if ($('#RestoreScoreH').val() == $('#RestoreScoreA').val()) {
                Validate.fail("Game can't be drawn.");
            }
            
            return true;
        }
        
        Validate.ResultHeight = function(value) {
            var playoffStages = ["Third Place", "Final"];
            
            if ($.inArray($('#RestoreStage').val(), playoffStages) == -1) {
                if (value == 4) {
                    Validate.fail("Score too high.");
                }
            }
            
            return true;
        }
        
        Validate.PlayerEquality = function() {
            if ($('#RestoreHomeId').val() == $('#RestoreAwayId').val()) {
                Validate.fail("Players are equal.");
            }
            
            return true;
        }
        
        RestoreAdd.ReportedYear.add(Validate.Presence);

        RestoreAdd.Stage.add(Validate.Presence);

        RestoreAdd.HomeId.add(Validate.Presence);
        RestoreAdd.HomeId.add(Validate.PlayerEquality);

        RestoreAdd.AwayId.add(Validate.Presence);
        RestoreAdd.AwayId.add(Validate.PlayerEquality);

        RestoreAdd.ScoreH.add(Validate.Presence);
        RestoreAdd.ScoreH.add(Validate.ResultEquality);
        RestoreAdd.ScoreH.add(Validate.ResultHeight);

        RestoreAdd.ScoreA.add(Validate.Presence);
        RestoreAdd.ScoreA.add(Validate.ResultEquality);
        RestoreAdd.ScoreA.add(Validate.ResultHeight);
        
        $('#RestoreAddForm').submit(function() {
            console.log("Called!");
            
            $.each(RestoreAdd, function(key, val) {
                console.log(key + ": " + val);
                val.validate();
            });
        });
    });
</script>

<div id="boxFloat" style="background-color:#3F2828; text-align:center; width:785px; height:80px;">
    <h1 style="margin-top:0px;">Restore the CWT archive</h1>
    Add a game of CWT that was played back from 2002 to 2009 to the database of CWT.<br>
    It will help to restore the archive of CWT. Thank you for your help!
</div>
<div id="box" style="background-color:#3F2828; text-align:center; height:80px; margin-left:838px; width:100px;">
    <a href="/tournaments/download/cwt2009">
        <img src="/img/arrow_down.png">
        <br><br>
        Download<br>the old site
    </a>
</div>
<div id="boxFloat" style="background-color:#2F2923; text-align:center; width:785px; margin-top:10px;">
    <?php
    echo $this->Form->create('Restore', array(
        'inputDefaults' => array(
            'label' => false,
            'div' => false,
            'error' => false
        ),
        'type' => 'file'
    ));
    ?>

    <table align="center" cellpadding="5" cellspacing="0" border="0">
        <tr>
            <td width="50%" align="right">
                <b>Year:</b>
            </td>
            <td width="50%" align="left">
                <?php echo $this->Form->year('reported', 2002, 2009); ?>
            </td>
        </tr>
        <tr>
            <td align="right">
                <b>Stage:</b>
            </td>
            <td align="left">
                <?php echo $this->Form->input('stage', array('empty' => true)); ?>
            </td>
        </tr>
        <tr>
            <td align="right">
                <b>Reported:</b>
            </td>
            <td align="left">
                <?php echo $this->Form->month('reported'); ?>
                <?php echo $this->Form->day('reported'); ?>
            </td>
        </tr>
        <tr>
            <td align="right">
                <b>Home:</b>
            </td>
            <td align="left">
                <?php echo $this->Form->input('home_id', array('empty' => true)); ?>
            </td>
        </tr>
        <tr>
            <td align="right">
                <b>Away:</b>
            </td>
            <td align="left">
                <?php echo $this->Form->input('away_id', array('empty' => true)); ?>
            </td>
        </tr>
        <tr>
            <td align="right">
                <b>Score Home:</b>
            </td>
            <td align="left">
                <?php echo $this->Form->select('score_h', $scores, array('empty' => false)); ?>
            </td>
        </tr>
        <tr>
            <td align="right">
                <b>Score Away:</b>
            </td>
            <td align="left">
                <?php echo $this->Form->select('score_a', $scores, array('empty' => false)); ?>
            </td>
        </tr>
        <tr>
            <td align="right">
                <span class="RestoreAddFormSuccess"></span>
            </td>
            <td align="left">
                <?php
                echo $this->Js->submit('Submit', array(
                    'div' => false,
                    'before' => $this->Js->get('.RestoreAddFormLoading')->effect('fadeIn'),
                    'success' => $this->Js->get('.RestoreAddFormLoading')->effect('fadeOut'),
                    'update' => '.RestoreAddFormSuccess'
                ));
                ?>
                <img class="RestoreAddFormLoading" id="loading" src="/img/loading.gif">
            </td>
        </tr>
    </table>
    <?php echo $this->Form->end() ?>
</div>
<div id="box" style="background-color:#2F2923; text-align:center; margin-left:838px; white-space:nowrap;">
    <span style="font-size:12pt; font-weight:bold;">Number of<br>Added Games</span>
    <br>
    <table align="center">
        <?php foreach ($numberOfAddedGames as $key => $val): ?>
            <tr>
                <td align="right"><b><?php echo $key ?>:</b></td>
                <td align="left"><?php echo $val ?></td>
            </tr>
        <?php endforeach; ?>
        <br>
    </table>
    <br>
    Thanks to the<br>submitters!
</div>