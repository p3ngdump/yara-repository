rule win_evilbunny_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.evilbunny."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.evilbunny"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 8b55a8 8b4508 8a08 880a 8b55a8 83c201 8955a8 }
            // n = 7, score = 200
            //   8b55a8               | mov                 edx, dword ptr [ebp - 0x58]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   880a                 | mov                 byte ptr [edx], cl
            //   8b55a8               | mov                 edx, dword ptr [ebp - 0x58]
            //   83c201               | add                 edx, 1
            //   8955a8               | mov                 dword ptr [ebp - 0x58], edx

        $sequence_1 = { 8d4d84 e8???????? 8a8547fdffff 52 8bcd 50 8d15dceb1100 }
            // n = 7, score = 200
            //   8d4d84               | lea                 ecx, [ebp - 0x7c]
            //   e8????????           |                     
            //   8a8547fdffff         | mov                 al, byte ptr [ebp - 0x2b9]
            //   52                   | push                edx
            //   8bcd                 | mov                 ecx, ebp
            //   50                   | push                eax
            //   8d15dceb1100         | lea                 edx, [0x11ebdc]

        $sequence_2 = { 8b8dd8feffff 0b8dd4feffff 238dd0feffff 0bd1 03c2 8945f4 8b95ccfeffff }
            // n = 7, score = 200
            //   8b8dd8feffff         | mov                 ecx, dword ptr [ebp - 0x128]
            //   0b8dd4feffff         | or                  ecx, dword ptr [ebp - 0x12c]
            //   238dd0feffff         | and                 ecx, dword ptr [ebp - 0x130]
            //   0bd1                 | or                  edx, ecx
            //   03c2                 | add                 eax, edx
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b95ccfeffff         | mov                 edx, dword ptr [ebp - 0x134]

        $sequence_3 = { e8???????? 83c408 8b4d10 51 8b5508 8b4240 50 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   51                   | push                ecx
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4240               | mov                 eax, dword ptr [edx + 0x40]
            //   50                   | push                eax

        $sequence_4 = { 734a 8b45d4 2b45cc 50 8b4dcc 51 8d55b0 }
            // n = 7, score = 200
            //   734a                 | jae                 0x4c
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   2b45cc               | sub                 eax, dword ptr [ebp - 0x34]
            //   50                   | push                eax
            //   8b4dcc               | mov                 ecx, dword ptr [ebp - 0x34]
            //   51                   | push                ecx
            //   8d55b0               | lea                 edx, [ebp - 0x50]

        $sequence_5 = { 8b4dfc e8???????? 0345f8 8945f8 e9???????? b801000000 83c420 }
            // n = 7, score = 200
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   0345f8               | add                 eax, dword ptr [ebp - 8]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   e9????????           |                     
            //   b801000000           | mov                 eax, 1
            //   83c420               | add                 esp, 0x20

        $sequence_6 = { 8b5508 0fb64201 c1f804 83e00f 0bc8 8b55fc a1???????? }
            // n = 7, score = 200
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   0fb64201             | movzx               eax, byte ptr [edx + 1]
            //   c1f804               | sar                 eax, 4
            //   83e00f               | and                 eax, 0xf
            //   0bc8                 | or                  ecx, eax
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   a1????????           |                     

        $sequence_7 = { 8b8d70eeffff 898d90eeffff 8b9590eeffff 899598eeffff 8b8d98eeffff e8???????? 85c0 }
            // n = 7, score = 200
            //   8b8d70eeffff         | mov                 ecx, dword ptr [ebp - 0x1190]
            //   898d90eeffff         | mov                 dword ptr [ebp - 0x1170], ecx
            //   8b9590eeffff         | mov                 edx, dword ptr [ebp - 0x1170]
            //   899598eeffff         | mov                 dword ptr [ebp - 0x1168], edx
            //   8b8d98eeffff         | mov                 ecx, dword ptr [ebp - 0x1168]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_8 = { 8b550c 895114 8b45fc 8b4d10 894818 8b55f8 8955ec }
            // n = 7, score = 200
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   895114               | mov                 dword ptr [ecx + 0x14], edx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   894818               | mov                 dword ptr [eax + 0x18], ecx
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8955ec               | mov                 dword ptr [ebp - 0x14], edx

        $sequence_9 = { d9add6fdffff 8b8dc8fdffff 2b4dfc 51 8b550c 52 e8???????? }
            // n = 7, score = 200
            //   d9add6fdffff         | fldcw               word ptr [ebp - 0x22a]
            //   8b8dc8fdffff         | mov                 ecx, dword ptr [ebp - 0x238]
            //   2b4dfc               | sub                 ecx, dword ptr [ebp - 4]
            //   51                   | push                ecx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   52                   | push                edx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 1695744
}